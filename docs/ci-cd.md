# CI/CD

## Planned shared engine build

**Status: planned.** CI will run the same `vapour build` then chunked publish as
local development. Pin a compatible CLI once released; provision Godot templates,
Unity editor/WebGL modules/license, or Rust target/wasm-bindgen first. The CLI
never installs them. Existing external-export workflows can select build mode
none. Keep tokens in CI secrets; signed object URLs must not receive API tokens.
See [large games](large-games.md). Do not assume the current v1 Action exposes
these unreleased options.

Publish on every tag (or push) with GitHub Actions and [vapour-ci](https://github.com/vapour-computer/vapour-ci).

1. Create a Vapour token for CI and add it as a repository secret named `VAPOUR_TOKEN`.
2. Make sure `vapour.toml` is committed (with its `id`).
3. Copy a workflow from the [templates](https://github.com/vapour-computer/vapour-ci/tree/main/templates) into
   `.github/workflows/`:
   - `godot-publish.yml`
   - `unity-publish.yml`
   - `bevy-publish.yml`

The publish step is one line:

```yaml
- uses: vapour-computer/vapour-ci@v1
  with:
    token: ${{ secrets.VAPOUR_TOKEN }}
    dir: .
```

Outside GitHub Actions, set `VAPOUR_TOKEN` in your CI and run `vapour publish`.
