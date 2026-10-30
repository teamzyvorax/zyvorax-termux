#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ARCH="${1:-aarch64}"
case "$ARCH" in aarch64|arm|i686|x86_64) ;; *) echo "Unsupported architecture: $ARCH" >&2; exit 2;; esac
WORK="${ZYVORAX_BUILD_DIR:-$ROOT/.termux-packages-build}"
if [[ ! -d "$WORK/.git" ]]; then
  git clone --depth=1 https://github.com/termux/termux-packages.git "$WORK"
else
  git -C "$WORK" pull --ff-only
fi
mkdir -p "$WORK/packages/zyvorax"
cp "$ROOT"/packages/zyvorax/* "$WORK/packages/zyvorax/"
cd "$WORK"
if [[ "${ZYVORAX_SKIP_SETUP:-0}" != "1" && ! -f .zyvorax-setup-done ]]; then
  echo "Preparing the official Termux build environment (requires sudo on Ubuntu)."
  ./scripts/setup-ubuntu.sh
  touch .zyvorax-setup-done
fi
echo "Building ZYVORAX for $ARCH using the official Termux package builder."
./build-package.sh -a "$ARCH" -I zyvorax
echo "Build finished. Check $WORK/output/ for the generated .deb package."
