# Godot

Godot 4 exports to the browser with its built-in Web export.

## Export

1. Install the **export templates** (Editor → Manage Export Templates).
2. **Project → Export → Add… → Web**.
3. Recommended settings:
   - **Renderer:** use the *Compatibility* renderer (WebGL 2). *Forward+* and *Mobile* need desktop GPUs.
   - **Thread Support:** off is the safest choice. Turn it on only if your game needs threads; threaded games need a
     cross-origin-isolated host, which the Vapour player provides for games hosted with it.
   - **Export Type:** *Regular*.
4. Set the export path to `build/web/index.html` and click **Export Project**. Keep the file name `index.html`.
5. `vapour publish`

## `vapour.toml`

```toml
[project]
title = "My Godot Game"
slug = "my-godot-game"
engine = "godot"
version = "0.1.0"

[build]
dir = "build/web"
```

## Headless export (for CI)

```sh
godot --headless --export-release "Web" build/web/index.html
```

C# (.NET) Godot projects cannot export to the web yet. Use GDScript.
