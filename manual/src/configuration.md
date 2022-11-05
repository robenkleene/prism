# Configuration

## Git config file

The most convenient way to configure prism is with a `[prism]` section in `~/.gitconfig`. Here's an example:

<sub>

```gitconfig
[core]
    pager = prism

[interactive]
    diffFilter = prism --color-only --features=interactive

[prism]
    features = decorations

[prism "interactive"]
    keep-plus-minus-markers = false

[prism "decorations"]
    commit-decoration-style = blue ol
    commit-style = raw
    file-style = omit
    hunk-header-decoration-style = blue box
    hunk-header-file-style = red
    hunk-header-line-number-style = "#067a00"
    hunk-header-style = file line-number syntax
```

</sub>

Use `prism --help` to see all the available options.

Note that prism style argument values in ~/.gitconfig should be in double quotes, like `--minus-style="syntax #340001"`. For theme names and other values, do not use quotes as they will be passed on to prism, like `theme = Monokai Extended`.

All git commands that display diff output should now display syntax-highlighted output. For example:

- `git diff`
- `git show`
- `git log -p`
- `git stash show -p`
- `git reflog -p`
- `git add -p`

To change your prism options in a one-off git command, use `git -c`. For example

```
git -c prism.line-numbers=false show
```

There are several important environment variables that affect prism configuration and which can be used to configure prism dynamically.
Please see [Environment variables](./environment-variables.md).
In particular, note that prism does not currently honor all relevant [git environment variables](https://git-scm.com/docs/git-config#_environment), since prism uses [libgit2](https://github.com/libgit2/libgit2) to read git config.
