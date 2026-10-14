# Bevy (Rust)

## Planned automated build and lazy assets

**Status: planned** for release; [adapter source preview](https://github.com/vapour-computer/vapour-cli/pull/1).
`vapour build` uses installed Cargo with wasm32-unknown-unknown, wasm-bindgen
`--target web`, and optional wasm-opt; generates index.html and copies assets/.
Install a wasm-bindgen CLI matching the dependency in your lockfile. The preview
requires one binary in the root package; use custom mode for workspaces.
Tools/targets are checked, never installed automatically.

HTML/JS/WASM are boot files; assets/ is lazy metadata. Split large scenes and
asset archives, load only first-scene handles through AssetServer, and drop
unused handles to permit unloading. Relative URLs must work below the game's
play path. An engine can still request all lazy assets immediately; measure its
actual behavior. Warn above 1 GiB/file. See [large games](../large-games.md).

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
