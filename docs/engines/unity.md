# Unity

## Planned automated build and Addressables

**Status: planned** for release; [adapter source preview](https://github.com/vapour-computer/vapour-cli/pull/1).
`vapour build` invokes an installed Unity editor (`UNITY_EDITOR`) in batch WebGL
mode through `Vapour.Build.Perform`. `vapour create --engine unity` supplies the
`Vapour/Build` editor script; existing projects must copy it to Assets/Editor.
Enable build scenes and install WebGL support. The CLI checks Addressables and
warns if absent; it does not create groups or build remote bundles for you.
Unity licensing, including on CI, stays the developer's responsibility.

Warn above 1 GiB per file. Keep the startup scene and minimal resources in the
main `.data`; move optional levels/textures/audio into remote Addressables groups,
build their catalogs/bundles and load/release them on demand. Configure relative
or allowed HTTPS load paths and CORS. Test decompression fallback, including
`.unityweb` payloads, and peak memory. Boot includes HTML/JS/WASM/startup data.
Large delivery quotas do not remove WASM limits. See [large games](../large-games.md).

## Export

1. **File → Build Profiles → Web**, then **Switch Profile**.
2. In **Player Settings → Publishing Settings**, use **Brotli** (or *Gzip*) and turn on
   **Decompression Fallback** for compatibility while serving paths are still rolling out.
   Do not assume every host automatically sends correct `Content-Encoding` yet.
3. **Build** into `build/web/`. The folder must contain `index.html` and a `Build/` folder.
4. `vapour publish`

## `vapour.toml`

```toml
[project]
title = "My Unity Game"
slug = "my-unity-game"
engine = "unity"
version = "0.1.0"

[build]
dir = "build/web"
```

Unity WebGL builds are larger than most engines' (an empty project is several MB). Keep textures and audio compressed.
