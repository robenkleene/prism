# Build prism from source

You'll need to [install the rust tools](https://www.rust-lang.org/learn/get-started). Then:

```sh
cargo build --release
```

and use the executable found at `./target/release/prism`.

Alternatively, homebrew users can do

```sh
brew install --HEAD git-prism
```

to install the development version of prism with merged but unreleased changes.
