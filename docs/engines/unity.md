# Unity

## Export

1. **File → Build Profiles → Web**, then **Switch Profile**.
2. In **Player Settings → Publishing Settings**, set **Compression Format** to *Disabled* or *Gzip*, and turn on
   **Decompression Fallback**. This makes the build work no matter how it is served.
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
