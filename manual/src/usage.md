# Usage

The main way to use prism is to configure it as the pager for git: see [Configuration](./configuration.md).

Prism can also be used as a shorthand for diffing two files, even if they are not in a git repo: the following two commands do the same thing:

```
prism /somewhere/a.txt /somewhere/else/b.txt

git diff /somewhere/a.txt /somewhere/else/b.txt
```

You can also use [process substitution](https://en.wikipedia.org/wiki/Process_substitution) shell syntax with prism, e.g.

```
prism <(sort file1) <(sort file2)
```

In addition to git output, prism handles standard unified diff format, e.g. `diff -u a.txt b.txt | prism`.

For Mercurial, you can add prism, with its command line options, to the `[pager]` section of `.hgrc`.
