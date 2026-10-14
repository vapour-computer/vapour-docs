# `vapour.toml`

## Planned build configuration

**Status: planned** for a future release. The [build adapter PR](https://github.com/vapour-computer/vapour-cli/pull/1)
is source preview, not a released CLI guarantee.

```text
[build]
command = "auto"          # auto | custom | none
dir = "build/web"         # exporter output directory
boot = ["index.html", "*.js", "*.wasm", "*.pck"]
split_warn_mib = 1024     # warn above this size; does not raise engine limits
# custom mode also supplies args = ["exporter", "--web"]
```

Auto selects the project engine. None validates existing output; custom runs an
executable/argv without a shell. Boot overrides replace engine defaults; globs
use Go filepath.Match (`*` does not cross directories; no recursive `**`).
The preview writes `.vapour/build.json`; integration with chunk publish follows
separately. See the [large-game plan](large-games.md).

Lives in your game folder. `vapour create` writes it for you.

```toml
[project]
id = "..."          # set by `vapour create` / first publish. Do not edit.
title = "My Game"
slug = "my-game"    # your game's URL: /games/my-game
engine = "godot"    # godot | unity | bevy | other
version = "0.1.0"   # letters, digits and . + _ -

[build]
dir = "build/web"   # your web export folder, or a path to a .zip

[store]
page = "store/page.json"       # JSON template: details, media files, layout
content = "store/template.md"  # Markdown text of your store page
notes = ""                     # optional: Markdown release notes for this version
```

`vapour create` writes the `[store]` section and the `store/` files. See [the store page guide](store-page.md).

Run `vapour publish --version X` to override `version` for one publish.
