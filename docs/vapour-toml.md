# `vapour.toml`

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
cover = "cover.png" # optional store image (png, jpg or webp, up to 5 MiB)
```

Run `vapour publish --version X` to override `version` for one publish.
