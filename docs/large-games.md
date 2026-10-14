# Large games

**Status: planned.** Current releases publish ZIPs, not the pipeline below.
Current limits are 512 MiB compressed ZIP, 1 GiB expanded, 512 MiB/file and 5,000
entries. Store requests and Cloud Run HTTP/1 ingress have a 32 MiB cap. There is
no special 42 MB limit; a larger router limit does not bypass Cloud Run ingress.

The target is 50 GiB/game and 4 GiB/file. CLI will create ~4 MiB content-defined
SHA-256 chunks, zstd-compress suitable data, write a path/size/ordered-hash/boot
manifest, negotiate missing chunks and upload in parallel directly to Storage
using short-lived resumable signed URLs. Finalize checks existence/size/quotas,
stores the manifest and switches the active version; re-hashing follows in the
background. Unchanged chunks are skipped. Small builds retain a ZIP fallback.

A worker on the separate game origin will assemble Range requests from verified
CDN chunks, cache them in OPFS, prefetch boot files and lazily load other assets.
OPFS failure/eviction falls back to network-only. Chunking does not remove WASM32's
roughly 4 GiB address space or engine whole-file loading. Warn above 1 GiB/file;
split Godot packs, Unity Addressables or Bevy assets before reaching that point.
50 GiB delivered is not a promise that 50 GiB fits into browser memory.

`vapour build` source preview covers [Godot](engines/godot.md),
[Unity](engines/unity.md) and [Bevy](engines/bevy.md). Install editors/templates
yourself; the CLI only checks them. Production signing/CDN, compression decoding,
quota prompts and deployed large-game playback remain planned.
