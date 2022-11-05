# How prism works

If you configure prism in gitconfig as above, then git will automatically send its output to prism.
Prism in turn passes its own output on to a "real" pager.
Note that git will only send its output to prism if git believes that its output is going to a terminal (a "tty") for a human to read.
In other words, if you do something like `git diff | grep ...` then you don't have to worry about prism changing the output from git, because prism will never be invoked at all.
If you need to force prism to be invoked when git itself would not invoke it, then you can always pipe to prism explicitly.
For example, `git diff | prism | something-that-expects-prism-output-with-colors` (in this example, git's output is being sent to a pipe, so git itself will not invoke prism).
In general however, prism's output is intended for humans, not machines.

If you are interested in the implementation of prism, please see [ARCHITECTURE.md](https://github.com/dandavison/prism/blob/master/ARCHITECTURE.md).
