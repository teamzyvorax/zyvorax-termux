# ZYVORAX Termux Package

This repository contains the source recipe for the **ZYVORAX Math Lab** Termux package.

- Debian package name: `zyvora`
- Installed command: `zyvorax`
- Install location: `$PREFIX/bin/zyvorax`
- Runtime dependency: `bc`

## Build using the official Termux package builder

The recipe must be placed in a checkout of the official
[termux/termux-packages](https://github.com/termux/termux-packages) repository.

```bash
git clone https://github.com/termux/termux-packages.git
cd termux-packages
mkdir -p packages/zyvora
cp /path/to/zyvorax-termux/packages/zyvora/* packages/zyvora/
./build-package.sh -I zyvora
```

The official builder uses the recipe at `packages/zyvora/build.sh` and writes built
Debian packages under its output directory. The default target architecture is
aarch64; select another supported architecture with `-a` when building.

## Test the resulting package

On a compatible Termux installation, install the generated .deb with dpkg for
a local test, then run:

```bash
zyvorax version
zyvorax calc '25 * 40'
zyvorax
```

## Important: repository publication is a separate step

Building a .deb does not make `pkg install zyvora` available to all users.
A public APT repository, architecture-specific package builds, signed repository
metadata, and one-time repository setup by each user are still required. Do not
add an unverified repository or claim public installation is ready until those
steps have been completed and tested.
