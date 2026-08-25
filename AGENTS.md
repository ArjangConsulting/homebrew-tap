# amoo Homebrew Tap — Agent Guidance

This is the Homebrew tap for [amoo](https://github.com/ArjangConsulting/amoo-ai). Its only purpose is to distribute the `amoo` CLI via `brew install`.

## Repository layout

```text
Formula/
  amoo.rb       # The only formula — keep everything here
.github/
  workflows/    # Formula checks and update automation
README.md
CLAUDE.md
AGENTS.md
```

Do not add scripts, extra Ruby files, casks, aliases, or extra formulae unless explicitly asked.

## Updating the formula for a new release

The upstream release workflow (`amoo-ai/.github/workflows/release.yml`) pushes an updated
`Formula/amoo.rb` here automatically on every tag. Manual updates are only needed if that push was
skipped:

1. Download the release tarballs and compute their SHA256 — see amoo-ai's
   `docs/homebrew.md` and `scripts/update-formula.sh`.
2. Edit `Formula/amoo.rb` — update `version` and both `sha256` fields under `on_macos do` /
   `on_linux do`. The URLs use the bare tag (no `v` prefix).
3. Update the formula version table in `README.md`.
4. Validate locally before committing (see Testing section below).
5. Commit with the message `amoo <VERSION>`.

## Testing a formula change locally

Homebrew requires the formula to be inside a registered tap. Use the local directory:

```bash
brew tap arjangconsulting/tap /path/to/this/repo
brew install --build-from-source arjangconsulting/tap/amoo
brew test arjangconsulting/tap/amoo
# Clean up after testing:
brew uninstall amoo
brew untap arjangconsulting/tap
```

For syntax and style checks without installing:

```bash
brew style Formula/amoo.rb
brew audit --new Formula/amoo.rb   # use --new only for the first release
brew audit Formula/amoo.rb         # use this for subsequent updates
```

## Formula conventions

- `desc` must be a single sentence, no trailing period, ≤ 80 characters.
- `url` always points to the prebuilt release binary tarball for the release tag, not a source
  archive — `amoo-<version>-macos-universal.tar.gz` / `amoo-<version>-linux-static.tar.gz`.
- `sha256` must be computed from the actual downloaded tarball — never guessed.
- `head` always tracks the `main` branch.
- The `test` block must assert both `--help` output and semver-shaped `--version` output. Do not
  hardcode an exact release version in the test.
- The `Update Formula` workflow can poll upstream releases and update the source formula
  automatically.

## What NOT to do

- Do not add dependencies to the formula.
- Do not add casks, tap commands, or aliases.
- Do not build from source in the formula — always point at the prebuilt release tarballs.
- Do not copy or reference the amoo-ai main repo's architecture docs here.

## Commit style

Single-line messages only:

```
amoo <VERSION>                          # version bump
Fix formula download URL for Linux      # bug fix
Update README install instructions      # docs
```

## Reference

- Homebrew tap naming convention: repo must be named `homebrew-<tap-name>`; `brew tap <org>/<tap-name>` resolves to `github.com/<org>/homebrew-<tap-name>`.
- Upstream project: https://github.com/ArjangConsulting/amoo-ai
- Homebrew formula cookbook: https://docs.brew.sh/Formula-Cookbook
