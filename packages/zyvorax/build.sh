TERMUX_PKG_HOMEPAGE=https://github.com/teamzyvorax/zyvorax-termux
TERMUX_PKG_DESCRIPTION="ZYVORAX all-in-one Android Linux command environment"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="Team Zyvora"
TERMUX_PKG_VERSION=0.1.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="bash, coreutils, findutils, grep, sed, bc"
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_make_install() {
    install -Dm755 "$TERMUX_PKG_BUILDER_DIR/zyvorax" \
        "$TERMUX_PREFIX/bin/zyvorax"
}
