use lazy_static::lazy_static;
use regex::Regex;
use std::collections::HashMap;

use crate::cli;
use crate::features;
use crate::git_config::{self, GitConfigGet};
use crate::options::option_value::{OptionValue, ProvenancedOptionValue};
use ProvenancedOptionValue::*;

// Look up a value of type `T` associated with `option name`. The search rules are:
//
// 1. If there is a value associated with `option_name` in the main [prism] git config
//    section, then stop searching and return that value.
//
// 2. For each feature in the ordered list of enabled features:
//
//    2.1 Look-up the value, treating `feature` as a custom feature.
//        I.e., if there is a value associated with `option_name` in a git config section
//        named [prism "`feature`"] then stop searching and return that value.
//
//    2.2 Look-up the value, treating `feature` as a builtin feature.
//        I.e., if there is a value (not a default value) associated with `option_name` in a
//        builtin feature named `feature`, then stop searching and return that value.
//        Otherwise, record the default value and continue searching.
//
// 3. Return the last default value that was encountered.
pub fn get_option_value<T>(
    option_name: &str,
    builtin_features: &HashMap<String, features::BuiltinFeature>,
    opt: &cli::Opt,
    git_config: &mut Option<git_config::GitConfig>,
) -> Option<T>
where
    T: GitConfigGet,
    T: GetOptionValue,
    T: From<OptionValue>,
    T: Into<OptionValue>,
{
    T::get_option_value(option_name, builtin_features, opt, git_config)
}

lazy_static! {
    static ref GIT_CONFIG_THEME_REGEX: Regex = Regex::new(r"^prism\.(.+)\.(light|dark)$").unwrap();
}

pub fn get_themes(git_config: Option<git_config::GitConfig>) -> Vec<String> {
    let mut themes: Vec<String> = Vec::new();
    for e in &git_config.unwrap().config.entries(None).unwrap() {
        let entry = e.unwrap();
        let entry_name = entry.name().unwrap();
        let caps = GIT_CONFIG_THEME_REGEX.captures(entry_name);
        if let Some(caps) = caps {
            let name = caps.get(1).map_or("", |m| m.as_str()).to_string();
            if !themes.contains(&name) {
                themes.push(name)
            }
        }
    }
    themes.sort_by_key(|a| a.to_lowercase());
    themes
}

pub trait GetOptionValue {
    fn get_option_value(
        option_name: &str,
        builtin_features: &HashMap<String, features::BuiltinFeature>,
        opt: &cli::Opt,
        git_config: &mut Option<git_config::GitConfig>,
    ) -> Option<Self>
    where
        Self: Sized,
        Self: GitConfigGet,
        Self: From<OptionValue>,
        Self: Into<OptionValue>,
    {
        if let Some(git_config) = git_config {
            if let Some(value) = git_config.get::<Self>(&format!("prism.{}", option_name)) {
                return Some(value);
            }
        }
        if let Some(features) = &opt.features {
            for feature in features.split_whitespace().rev() {
                match Self::get_provenanced_value_for_feature(
                    option_name,
                    feature,
                    builtin_features,
                    opt,
                    git_config,
                ) {
                    Some(GitConfigValue(value)) | Some(DefaultValue(value)) => {
                        return Some(value.into());
                    }
                    None => {}
                }
            }
        }
        None
    }

    /// Return the value, or default value, associated with `option_name` under feature name
    /// `feature`. This may refer to a custom feature, or a builtin feature, or both. Only builtin
    /// features have defaults. See `GetOptionValue::get_option_value`.
    fn get_provenanced_value_for_feature(
        option_name: &str,
        feature: &str,
        builtin_features: &HashMap<String, features::BuiltinFeature>,
        opt: &cli::Opt,
        git_config: &mut Option<git_config::GitConfig>,
    ) -> Option<ProvenancedOptionValue>
    where
        Self: Sized,
        Self: GitConfigGet,
        Self: Into<OptionValue>,
    {
        if let Some(git_config) = git_config {
            if let Some(value) =
                git_config.get::<Self>(&format!("prism.{}.{}", feature, option_name))
            {
                return Some(GitConfigValue(value.into()));
            }
        }
        if let Some(builtin_feature) = builtin_features.get(feature) {
            if let Some(value_function) = builtin_feature.get(option_name) {
                return Some(value_function(opt, git_config));
            }
        }
        None
    }
}

impl GetOptionValue for Option<String> {}
impl GetOptionValue for String {}
impl GetOptionValue for bool {}
impl GetOptionValue for f64 {}
impl GetOptionValue for usize {}

#[cfg(test)]
pub mod tests {
    use std::fs::remove_file;

    use crate::cli::Opt;
    use crate::env::PrismEnv;
    use crate::options::get::get_themes;
    use crate::tests::integration_test_utils;

    // fn generic<T>(_s: SGen<T>) {}
    fn _test_env_var_overrides_git_config_generic(
        git_config_contents: &[u8],
        git_config_path: &str,
        env_value: String,
        fn_cmp_before: &dyn Fn(Opt),
        fn_cmp_after: &dyn Fn(Opt),
    ) {
        let opt = integration_test_utils::make_options_from_args_and_git_config(
            &[],
            Some(git_config_contents),
            Some(git_config_path),
        );
        fn_cmp_before(opt);

        let opt = integration_test_utils::make_options_from_args_and_git_config_honoring_env_var_with_custom_env(
            PrismEnv {
                git_config_parameters: Some(env_value),
                ..PrismEnv::default()
            },
            &[],
            Some(git_config_contents),
            Some(git_config_path),
        );
        fn_cmp_after(opt);

        remove_file(git_config_path).unwrap();
    }
    #[test]
    fn test_env_var_overrides_git_config_simple_string() {
        let git_config_contents = b"
[prism]
    plus-style = blue
";
        let git_config_path = "prism__test_simple_string_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            "'prism.plus-style=green'".into(),
            &|opt: Opt| assert_eq!(opt.plus_style, "blue"),
            &|opt: Opt| assert_eq!(opt.plus_style, "green"),
        );
    }

    #[test]
    fn test_env_var_overrides_git_config_complex_string() {
        let git_config_contents = br##"
[prism]
    minus-style = red bold ul "#ffeeee"
"##;
        let git_config_path = "prism__test_complex_string_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            r##"'prism.minus-style=magenta italic ol "#aabbcc"'"##.into(),
            &|opt: Opt| assert_eq!(opt.minus_style, r##"red bold ul #ffeeee"##),
            &|opt: Opt| assert_eq!(opt.minus_style, r##"magenta italic ol "#aabbcc""##,),
        );
    }

    #[test]
    fn test_env_var_overrides_git_config_option_string() {
        let git_config_contents = b"
[prism]
    plus-style = blue
";
        let git_config_path = "prism__test_option_string_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            "'prism.plus-style=green'".into(),
            &|opt: Opt| assert_eq!(opt.plus_style, "blue"),
            &|opt: Opt| assert_eq!(opt.plus_style, "green"),
        );
    }

    #[test]
    fn test_env_var_overrides_git_config_bool() {
        let git_config_contents = b"
[prism]
    side-by-side = true
";
        let git_config_path = "prism__test_bool_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            "'prism.side-by-side=false'".into(),
            &|opt: Opt| assert_eq!(opt.side_by_side, true),
            &|opt: Opt| assert_eq!(opt.side_by_side, false),
        );
    }

    #[test]
    fn test_env_var_overrides_git_config_int() {
        let git_config_contents = b"
[prism]
    max-line-length = 1
";
        let git_config_path = "prism__test_int_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            "'prism.max-line-length=2'".into(),
            &|opt: Opt| assert_eq!(opt.max_line_length, 1),
            &|opt: Opt| assert_eq!(opt.max_line_length, 2),
        );
    }

    #[test]
    fn test_env_var_overrides_git_config_float() {
        let git_config_contents = b"
[prism]
    max-line-distance = 0.6
";
        let git_config_path = "prism__test_float_env_var_overrides_git_config.gitconfig";
        _test_env_var_overrides_git_config_generic(
            git_config_contents,
            git_config_path,
            "'prism.max-line-distance=0.7'".into(),
            &|opt: Opt| assert_eq!(opt.max_line_distance, 0.6),
            &|opt: Opt| assert_eq!(opt.max_line_distance, 0.7),
        );
    }

    #[test]
    fn test_prism_features_env_var() {
        let git_config_contents = b"
[prism]
    features = feature-from-gitconfig
";
        let git_config_path = "prism__test_prism_features_env_var.gitconfig";

        let opt = integration_test_utils::make_options_from_args_and_git_config(
            &[],
            Some(git_config_contents),
            Some(git_config_path),
        );
        assert_eq!(opt.features.unwrap(), "feature-from-gitconfig");
        assert_eq!(opt.side_by_side, false);

        let opt = integration_test_utils::make_options_from_args_and_git_config_with_custom_env(
            PrismEnv {
                features: Some("side-by-side".into()),
                ..PrismEnv::default()
            },
            &[],
            Some(git_config_contents),
            Some(git_config_path),
        );
        // `line-numbers` is a builtin feature induced by side-by-side
        assert_eq!(opt.features.unwrap(), "line-numbers side-by-side");
        assert_eq!(opt.side_by_side, true);

        let opt = integration_test_utils::make_options_from_args_and_git_config_with_custom_env(
            PrismEnv {
                features: Some("+side-by-side".into()),
                ..PrismEnv::default()
            },
            &[],
            Some(git_config_contents),
            Some(git_config_path),
        );
        assert_eq!(
            opt.features.unwrap(),
            "feature-from-gitconfig line-numbers side-by-side"
        );
        assert_eq!(opt.side_by_side, true);

        remove_file(git_config_path).unwrap();
    }

    #[test]
    fn test_get_themes_from_config() {
        let git_config_contents = r#"
[prism "dark-theme"]
    max-line-distance = 0.6
    dark = true

[prism "light-theme"]
    max-line-distance = 0.6
    light = true

[prism "light-and-dark-theme"]
    max-line-distance = 0.6
    light = true
    dark = true

[prism "Uppercase-Theme"]
    light = true

[prism "not-a-theme"]
    max-line-distance = 0.6
"#;
        let git_config_path = "prism__test_get_themes_git_config.gitconfig";

        let git_config = Some(integration_test_utils::make_git_config(
            &PrismEnv::default(),
            git_config_contents.as_bytes(),
            git_config_path,
            false,
        ));

        let themes = get_themes(git_config);

        assert_eq!(
            themes,
            [
                "dark-theme",
                "light-and-dark-theme",
                "light-theme",
                "Uppercase-Theme"
            ]
        );

        remove_file(git_config_path).unwrap();
    }
}
