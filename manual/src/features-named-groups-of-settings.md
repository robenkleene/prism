# "Features": named groups of settings

All prism options can go under the `[prism]` section in your git config file. However, you can also use named "features" to keep things organized: these are sections in git config like `[prism "my-feature"]`. Here's an example using two custom features:

```gitconfig
[prism]
    features = unobtrusive-line-numbers decorations
    whitespace-error-style = 22 reverse

[prism "unobtrusive-line-numbers"]
    line-numbers = true
    line-numbers-minus-style = "#444444"
    line-numbers-zero-style = "#444444"
    line-numbers-plus-style = "#444444"
    line-numbers-left-format = "{nm:>4}┊"
    line-numbers-right-format = "{np:>4}│"
    line-numbers-left-style = blue
    line-numbers-right-style = blue

[prism "decorations"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none
    hunk-header-decoration-style = yellow box
```

<table><tr><td><img width=400px src="https://user-images.githubusercontent.com/52205/86275048-a96ee500-bba0-11ea-8a19-584f69758aee.png" alt="image" /></td></tr></table>

The environment variable `DELTA_FEATURES` can used to enable features from the command line: it should be set to a space-separated string of feature names.
If you precede this with a `+` symbol, then the features are _added_ to those configured elsewhere, instead of replacing them.
This is very useful, for example to temporarily switch prism to side-by-side mode you can do

```
export DELTA_FEATURES=+side-by-side
```

and to undo that:

```
export DELTA_FEATURES=+
```
