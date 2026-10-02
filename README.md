# Ubuntu Prime Plymouth

A custom Ubuntu Plymouth theme built from scratch to replace the default boot splash with a cleaner and more polished look.

## Overview

This project was created after facing issues with the default Ubuntu Plymouth theme. Instead of modifying the stock version, the theme was rebuilt from scratch to provide a simple, stable, and visually improved boot screen.

## Features

- Custom boot splash design
- Built from scratch
- Lightweight and simple
- Suitable for Ubuntu-based systems
- Automated installation script
- Easy to customize

## Requirements

- Ubuntu or an Ubuntu-based Linux distribution
- Plymouth installed
- Root privileges (sudo)

## Installation

### Quick Install

Simply run the installation script:

```bash
git clone https://github.com/mr-coder-v4/Plymouth-V4.git
cd Plymouth-V4
sudo ./install.sh
```

The script will automatically:
- Copy the theme to the Plymouth themes directory
- Set it as the default theme
- Update the initramfs
- Prepare your system for the next boot

### Manual Installation

If you prefer to install manually, follow these steps:

```bash
sudo cp -r Plymouth-V4 /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/Plymouth-V4/Plymouth-V4.plymouth 100
sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/Plymouth-V4/Plymouth-V4.plymouth
sudo update-initramfs -u
```

## Reboot

After installation, reboot your system to see the new Plymouth theme:

```bash
sudo reboot
```

## Customization

You can modify the theme files in the project directory to change visuals, colors, and animation behavior. The Plymouth theme structure is flexible and can be adjusted to match your preferred boot experience.

## Notes

This project is intended for personal use and learning, but it can also be adapted for other Ubuntu-based systems with minor changes.

## License

This project is open for personal and educational use. Please respect the original work and give credit if used in other projects.

## Author

mr-coder-v4
