# ZYVORAX — All-in-One Termux Environment

ZYVORAX is a branded command environment for Android running the official Termux Linux userspace.

## Repository layout

- `packages/zyvorax/build.sh` — official Termux package recipe for package name `zyvorax`.
- `packages/zyvorax/zyvorax` — interactive CLI, package manager helpers, diagnostics, storage helper, and calculator.
- `packages/zyvora/` — legacy ZYVORAX Math Lab recipe retained for compatibility with earlier experiments.
- `android/` — APK integration requirements.

## Build the package

Use the official Termux package builder. Do not build this recipe with ordinary Ubuntu `dpkg-deb`; Termux packages must be built against the Termux packaging environment.

```bash
git clone https://github.com/termux/termux-packages.git
git clone https://github.com/teamzyvorax/zyvorax-termux.git
cd termux-packages
mkdir -p packages/zyvorax
cp ../zyvorax-termux/packages/zyvorax/* packages/zyvorax/
./build-package.sh -I zyvorax
```

The Termux package builder creates the package for the selected architecture. Build and test each supported architecture (aarch64, arm, i686, x86_64) before publishing.

## Install

Once `zyvorax` is available in a configured APT repository, install it with:

```bash
pkg update
pkg install zyvorax
zyvorax
```

**Important:** a GitHub source repository is not automatically an APT repository. A public `pkg install zyvorax` experience requires publishing architecture-compatible .deb packages and signed APT repository metadata, or getting the package accepted into the official Termux package repository. A new user's Termux installation cannot discover a private/custom package name until its repository is configured.

## Commands

```bash
zyvorax                  # interactive menu
zyvorax help
zyvorax version
zyvorax doctor
zyvorax update
zyvorax upgrade          # asks before upgrading
zyvorax install git python
zyvorax remove nano      # asks before removal
zyvorax search openssh
zyvorax dev               # asks before installing developer tools
zyvorax storage
zyvorax calc '25 * 40'
```

ZYVORAX does not silently run `pkg update` or `pkg upgrade` on every app launch. Upgrades can use mobile data and storage and should remain user-controlled.

## Android APK

The APK is a separate build target. It must be built from a pinned, branded fork of the official Termux Android application with its terminal emulator and compatible bootstrap/runtime. Installing the CLI package does not install an Android APK or create a Linux userspace on its own. See [android/README.md](android/README.md).

## License

MIT
