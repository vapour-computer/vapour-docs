# Bevy (Rust)

Bevy targets the browser through WebAssembly. [Trunk](https://trunkrs.dev) is the easiest way to produce an `index.html`.

## Export

1. `rustup target add wasm32-unknown-unknown` and `cargo install trunk`.
2. Add an `index.html` at the project root that links your crate:

```html
<!doctype html>
<html>
  <head><meta charset="utf-8"><title>My Bevy Game</title></head>
  <body><link data-trunk rel="rust" href="Cargo.toml" data-wasm-opt="z" /></body>
</html>
```

3. `trunk build --release --public-url ./ --dist build/web`
4. `vapour publish`

Use relative asset paths and the `webgl2` backend feature if you do not need WebGPU.

## `vapour.toml`

```toml
[project]
title = "My Bevy Game"
slug = "my-bevy-game"
engine = "bevy"
version = "0.1.0"

[build]
dir = "build/web"
```
