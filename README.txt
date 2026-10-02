Ubuntu Prime — Plymouth Boot Animation

A custom animated Ubuntu Plymouth theme built from the supplied reference.

VISUAL
• Pure black background
• Ubuntu mark, upper centre
• Smooth monochrome rotating spinner, centre
• Ubuntu wordmark, lower centre
• Responsive positioning for different resolutions
• Fade-in sequence at boot

INSTALL
1. Extract this ZIP.
2. Open a terminal in the extracted ubuntu-prime folder.
3. Run:

    sudo ./install.sh

4. Reboot:

    sudo reboot

VERIFY
    plymouth-set-default-theme

It should report:

    ubuntu-prime

RESTORE
Run:

    sudo ./uninstall.sh

The installer records the previously selected Plymouth theme and attempts to restore it.

NOTES
This is a Plymouth Script theme. The spinner is made from 48 individual
frames and is swapped by the Plymouth refresh callback.

The image elements are dynamically centered and vertically positioned using
the active display size, rather than being hard-coded for only 1366x768.
