# CI/CD

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
