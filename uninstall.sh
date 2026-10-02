#!/bin/bash
set -e

THEME="ubuntu-prime"
BACKUP="/var/lib/$THEME.previous"

echo "== Ubuntu Prime Plymouth restore =="

RESTORE=""
if [ -f "$BACKUP" ]; then
    RESTORE="$(sudo cat "$BACKUP" 2>/dev/null || true)"
fi

if [ -n "$RESTORE" ] && command -v plymouth-set-default-theme >/dev/null 2>&1; then
    sudo plymouth-set-default-theme -R "$RESTORE"
elif command -v plymouth-set-default-theme >/dev/null 2>&1; then
    sudo plymouth-set-default-theme -R spinner
else
    sudo update-alternatives --set default.plymouth \
        /usr/share/plymouth/themes/spinner/spinner.plymouth 2>/dev/null || true
    sudo update-initramfs -u
fi

sudo rm -rf "/usr/share/plymouth/themes/$THEME"
sudo rm -f "$BACKUP"

echo "Previous Plymouth theme restored."
plymouth-set-default-theme 2>/dev/null || true
