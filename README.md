# homebrew-tap

Homebrew tap for [amoo](https://github.com/ArjangConsulting/amoo-ai) — an AI-driven mobile testing framework for iOS and Android.

## Install

```sh
brew tap arjangconsulting/tap
brew install amoo
```

## Usage

```sh
amoo --help
amoo --version
```

## Formulas

| Formula | Version | Description |
|---------|---------|-------------|
| `amoo` | unreleased | AI-driven mobile testing framework for iOS and Android |

## Upgrade

```sh
brew update
brew upgrade amoo
```

## CI Install

Use the tap in CI the same way as local installs. Homebrew downloads the prebuilt binary — no Swift toolchain or compilation required.

```sh
brew tap arjangconsulting/tap
brew install amoo
amoo --version
```

## Maintainer Release Flow

1. Tag and release the upstream source repo (e.g. `0.1.0` in `ArjangConsulting/amoo-ai`).
2. The release workflow there builds and uploads `amoo-<VERSION>-macos-universal.tar.gz` and `amoo-<VERSION>-linux-static.tar.gz` to the GitHub release, then pushes a rendered `Formula/amoo.rb` here directly.
3. If that push is skipped (missing `HOMEBREW_TAP_TOKEN`), let the `Update Formula` workflow here pick up the release, or run it manually with the released version.
4. The updater downloads both binaries, computes their SHA256, updates `Formula/amoo.rb` and this README, then commits and pushes to `main`.
5. Verify a fresh install works:

```sh
brew untap arjangconsulting/tap || true
brew uninstall --force amoo || true
brew tap arjangconsulting/tap
brew install amoo
amoo --version
```

## Uninstall

```sh
brew uninstall amoo
brew untap arjangconsulting/tap
```

## Contributing

Bugs and formula update requests belong in the [amoo-ai](https://github.com/ArjangConsulting/amoo-ai) repository. Open issues there rather than here.

Pull requests that bump the formula version are welcome once a new release is tagged upstream.
