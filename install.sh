#!/bin/bash
set -e

THEME="ubuntu-prime"
DEST="/usr/share/plymouth/themes/$THEME"
HERE="$(cd "$(dirname "$0")" && pwd)"
BACKUP="/var/lib/$THEME.previous"

echo "== Ubuntu Prime Plymouth installer =="

sudo apt-get install -y plymouth

CURRENT=""
if command -v plymouth-set-default-theme >/dev/null 2>&1; then
    CURRENT="$(plymouth-set-default-theme 2>/dev/null || true)"
fi

if [ -n "$CURRENT" ] && [ "$CURRENT" != "$THEME" ]; then
    echo "$CURRENT" | sudo tee "$BACKUP" >/dev/null
fi

sudo mkdir -p "$DEST"
sudo cp -a "$HERE"/ubuntu-prime.plymouth \
          "$HERE"/ubuntu-prime.script \
          "$HERE"/ubuntu-mark.png \
          "$HERE"/ubuntu-wordmark.png \
          "$HERE"/spinner-*.png \
          "$DEST"/

if command -v plymouth-set-default-theme >/dev/null 2>&1; then
    sudo plymouth-set-default-theme -R "$THEME"
else
    sudo update-alternatives --install \
        /usr/share/plymouth/themes/default.plymouth \
        default.plymouth \
        "$DEST/ubuntu-prime.plymouth" 100
    sudo update-alternatives --set default.plymouth "$DEST/ubuntu-prime.plymouth"
    sudo update-initramfs -u
fi

echo
echo "Installed: $THEME"
echo "Current theme:"
plymouth-set-default-theme 2>/dev/null || true
echo
echo "Now reboot with:"
echo "  sudo reboot"
