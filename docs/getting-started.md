# Getting started

Vapour runs games in the browser, so you publish a **web export** of your game: a folder with an `index.html`, your game's
WebAssembly and data files. Native builds (`.exe`, `.app`) cannot run in a browser and are rejected.

## 1. Install the CLI

Download a binary from the [vapour-cli releases](https://github.com/vapour-computer/vapour-cli/releases), or:

```sh
go install github.com/vapour-computer/vapour-cli@latest
```

## 2. Sign in and create a token

1. Sign in to Vapour with Google and choose the **developer** role.
2. In the dashboard, open **Tokens** and create a token. Copy it now: it is shown once. Tokens start with `vpr_`.
3. Save it on your machine:

```sh
vapour login --token vpr_...
```

The token is stored in `~/.config/vapour/credentials`. You can revoke it from the dashboard at any time.

## 3. Create a project

```sh
vapour create "My Game" --engine godot
cd my-game
```

This registers the project and writes `vapour.toml`. To start from an existing game instead, clone it:

```sh
vapour create "My Game" --engine godot --from https://github.com/you/your-godot-game
```

## 4. Export for web

Follow your engine's guide ([Godot](engines/godot.md), [Unity](engines/unity.md), [Bevy](engines/bevy.md)) and export into
`build/web/`. The folder must contain `index.html`.

## 5. Publish

```sh
vapour publish
```

The CLI checks the folder, zips it, uploads it, and prints your game's page URL. Use `vapour publish --dry-run` to check
without uploading, and `--version 0.2.0` to publish a new version.

## Troubleshooting

| Message | Fix |
|---|---|
| `has no index.html` | Export for Web (HTML5) and set `build.dir` to the export folder |
| `found native binaries` | You zipped a desktop build. Upload the Web export only |
| `token check failed` / HTTP 401 | The token was revoked or mistyped. Create a new one and run `vapour login` again |
| `build is N MiB; the limit is 512 MiB` | Compress textures and audio, or remove unused assets |
