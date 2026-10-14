# Your game's store page

Every published game gets a page, like a store listing: a banner, a trailer, screenshots, your text, details, a category and a
list of versions with release notes. Players see **only published games**.

You describe the page with two files in your game's `store/` folder. `vapour create` writes both:

| File | What it holds |
|---|---|
| `store/template.md` | The text, in Markdown. Each `## ` heading is a section you can place on the page. |
| `store/page.json` | A JSON template: tagline, category, tags, details, links, the media files, and the layout (which sections show, in what order). |

`store/page.schema.json` (also written for you) lets editors such as VS Code check and autocomplete `page.json`.

## page.json

```json
{
  "$schema": "./page.schema.json",
  "version": 1,
  "game": { "tagline": "One button. Infinite neon.", "category": "arcade", "tags": ["2d", "one-button"] },
  "media": { "banner": "banner.png", "cover": "cover.png", "screenshots": ["shot-1.png", "shot-2.png"], "video": "trailer.mp4" },
  "sections": [
    { "type": "media" },
    { "type": "markdown", "anchor": "intro" },
    { "type": "markdown", "anchor": "about", "title": "About this game" },
    { "type": "markdown", "anchor": "credits", "title": "Credits" },
    { "type": "release_notes", "limit": 5 },
    { "type": "details" },
    { "type": "links" }
  ],
  "details": [ { "label": "Controls", "value": "Keyboard, gamepad" } ],
  "links": [ { "label": "Website", "url": "https://example.com" } ]
}
```

- **Dynamic layout:** add, remove or reorder `sections`. Types: `media` (trailer and screenshots), `markdown` (a part of your text),
  `release_notes`, `details` and `links`. Each type except `markdown` can appear once. At most 12 sections.
- **Markdown sections:** `anchor` names a `## ` heading in `template.md` (lowercase, hyphens: `## How to play` is `how-to-play`).
  `intro` is the text before the first heading. A section with no matching heading shows nothing, and `vapour store check` warns you.
- **Details and links** appear in the sidebar. Up to 20 details (label up to 40, value up to 200 characters) and 6 links (`https://` only).
- **Category** is one of: action, adventure, arcade, casual, horror, platformer, puzzle, racing, retro, rpg, shooter, simulation,
  sports, strategy, other. Up to 5 tags.

## Media

Paths in `media` are relative to `page.json`. Leave an entry empty to skip it.

| Media | Format | Limits |
|---|---|---|
| banner | PNG, JPEG or WebP | at least 960x300, 2:1 or wider, 4 MiB |
| cover | PNG, JPEG or WebP | at least 460x215, 2 MiB |
| screenshots (up to 8) | PNG, JPEG or WebP | at least 640x360, 4 MiB each |
| video | MP4 or WebM | 30 MiB |

Files are checked by their content, not their names. SVG, GIF and other formats are rejected. Keep the media for one upload under
30 MiB in total. Your text is stored as plain text and shown safely: raw HTML in Markdown is not rendered.

## Commands

```sh
vapour store check                         # validate everything without uploading
vapour store push                          # update only the store page
vapour publish --notes "What changed"      # store page + a new version of your build
```

Each version can be published once. Bump `version` in `vapour.toml` for the next release (`--version 1.2.0` also works). Release
notes come from `--notes`, `--notes-file`, or `store.notes` in `vapour.toml`.
