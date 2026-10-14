# Godot

## Planned automated build and split packs

**Status: planned** for release; [adapter source preview](https://github.com/vapour-computer/vapour-cli/pull/1).
`vapour build` checks an installed Godot 4 editor (`GODOT` override), a preset
named Web and matching export templates, imports headlessly and exports Web.
The default boot set is HTML, JavaScript, WASM and the main PCK. Compatibility is
required for these Web experiments; changing renderer does not guarantee visual
parity with Forward+. The CLI does not install tools/templates.

Warn above 1 GiB per file. Keep first-frame resources in the main pack; export
optional levels/content as separate PCKs and load them on demand using
`ProjectSettings.load_resource_pack` after downloading/mounting them using your
web-compatible loader. Avoid loading all packs before first frame. Test paths,
resource dependencies and memory on target browsers. Delivery chunking alone
does not make a monolithic PCK memory-safe. See [large games](../large-games.md).

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

## Try it with the sample

[`samples/godot-hello`](../../samples/godot-hello) is a tiny Godot 4 project with a Web export preset already set up
(Compatibility renderer, no threads). Open it in Godot, or export it headless as shown above, then `vapour publish`.
