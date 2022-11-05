# Get started

[Install](./installation.md) prism and add this to your `~/.gitconfig`:

```gitconfig
[core]
    pager = prism

[interactive]
    diffFilter = prism --color-only

[prism]
    navigate = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

```
