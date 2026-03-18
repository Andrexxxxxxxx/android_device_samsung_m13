# TWRP Device Tree for Samsung Galaxy M13 (SM-M135F)

## Device Specifications

- **Chipset:** Exynos 850 (8nm)
- **CPU:** Octa-core Cortex-A55
- **Architecture:** ARM32 with 64-bit binder
- **Platform:** universal3830
- **Android:** 14 (One UI 6.1)
- **Kernel:** 4.19.x

## Building with GitHub Actions (Recommended)

1. **Fork this repository** to your GitHub account

2. Go to **Actions** tab → **Build TWRP Recovery**

3. Click **Run workflow** and select:
   - Manifest Branch: `twrp-12.1`
   - Build Target: `recovery`

4. Wait for the build to complete (~2-3 hours)

5. Download `recovery.img` from **Releases** or **Artifacts**

## Manual Build

### Prerequisites
- Ubuntu 20.04/22.04 or similar Linux
- 100+ GB free disk space
- 16+ GB RAM (or swap)

### Steps

```bash
# Install dependencies
sudo apt install bc bison build-essential ccache curl flex g++-multilib \
    gcc-multilib git gnupg gperf libncurses5-dev lib32ncurses5-dev \
    libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool \
    squashfs-tools xsltproc zip zlib1g-dev python3 repo

# Initialize TWRP manifest
mkdir twrp && cd twrp
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1

# Sync sources
repo sync -j$(nproc)

# Clone device tree
git clone https://github.com/YOUR_USERNAME/android_device_samsung_m13 device/samsung/m13

# Build
source build/envsetup.sh
lunch twrp_m13-eng
make recoveryimage -j$(nproc)
```

Output: `out/target/product/m13/recovery.img`

## Installation

### Method 1: Odin (Windows)
1. Download Odin3
2. Boot phone to Download Mode: `Power Off` → `Vol Down + USB cable`
3. Open Odin, click **AP** and select `recovery.img`
4. Click **Start**

### Method 2: Heimdall (Linux/macOS)
```bash
heimdall flash --RECOVERY recovery.img
```

## Booting to TWRP

- **Buttons:** `Power Off` → `Vol Up + Power` (hold until logo appears)
- **ADB:** `adb reboot recovery`

## Known Issues

- **Decryption:** FBE decryption may not work on all firmware versions
- **Knox:** Will be tripped permanently after flashing

## Tested Firmware

- M135FXXSCEYK2 (Android 14, One UI 6.1)

## Credits

- [TWRP](https://twrp.me/)
- [twrpdtgen](https://github.com/SebaUbuntu/twrpdtgen)
- [physwizz](https://github.com/physwizz) - Exynos 850 reference

## Disclaimer

⚠️ **Flash at your own risk!** Backup all data before proceeding.
