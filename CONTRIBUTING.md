# Notes on contributing to prism

First off, thank you for considering contributing to prism.

If your contribution is not straightforward, please first discuss the change you
wish to make by creating a new issue before making the change.

## The codebase

Take a look at [ARCHITECTURE.md](./ARCHITECTURE.md).

## Set up

This is no different than other Rust projects.

```shell
git clone https://github.com/dandavison/prism/
cd prism
cargo build --release
```

The executable is then at `./target/release/prism`.

## Useful Commands

- Run all tests:

  ```shell
  make test
  ```

- Run Clippy:

  ```shell
  cargo clippy
  ```

- Check to see if there are code formatting issues

  ```shell
  cargo fmt -- --check
  ```

- Format the code in the project

  ```shell
  cargo fmt
  ```

- Debug build

A "debug" build can be built using `cargo build` and
`./target/debug/prism`. This is faster to compile, but has much worse
performance than the release build.
