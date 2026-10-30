# ZYVORAX Android APK

The Android APK is a separate deliverable from the Termux package.

The APK should be a branded fork of the official Termux Android app, retaining its terminal emulator, session handling, Android permission integration, and compatible bootstrap/runtime. The `zyvorax` package provides the ZYVORAX command environment inside Termux; it is not itself an APK and cannot provide a Linux userspace on a clean Android device.

APK release requirements:
1. Pin the official Termux app source revision and preserve upstream license notices.
2. Apply ZYVORAX application ID, name, icon, theme, and branding.
3. Include compatible bootstrap/runtime assets for supported Android ABIs.
4. Build with Gradle and test install, shell startup, package installation, storage permission, and upgrade on real devices.
5. Sign APKs reproducibly and publish checksums.

Do not label the package-only build as an APK or claim APK installation works until these checks pass.
