# Linux Multi-Package Installer

A modular bash script for automated installation of packages across different Linux distributions. The script handles native package managers (apt, dnf, pacman, zypper), Snap, and Flatpak installations with proper error handling and logging.

## Features

- 🔍 Automatic Linux distribution detection
- 📦 Support for multiple package managers:
  - Native (apt, dnf, pacman, zypper)
  - Snap (including classic confinement)
  - Flatpak
- 🚀 Easy package configuration
- 📝 Comprehensive logging
- ⚠️ Error handling
- 🛠️ Modular design for easy maintenance

## Directory Structure

```bash
linux-setup/
├── configs/
│   └── packages.conf       # Package definitions
├── lib/
│   ├── utils.sh           # Utility functions
│   ├── package_mgr.sh     # Package manager setup
│   └── installers.sh      # Installation functions
└── install_packages.sh     # Main script
```

## Prerequisites

- Bash shell
- sudo privileges
- Internet connection

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/linux-multi-package-installer.git
cd linux-multi-package-installer
```

2. Make scripts executable:
```bash
chmod +x install_packages.sh
chmod +x lib/*.sh
```

## UsageRun the main script:

```bash
./install_packages.sh
```

## Customizing Package Lists

Edit configs/packages.conf to modify the packages to be installed:

Sample config file:

```bash
# Native packages
NATIVE_PACKAGES=(
    "git"
    "curl"
    "wget"
    "neofetch"
    "bat"
    "fzf"
    "brave-browser"
)

# Snap packages
SNAP_PACKAGES=(
    "vlc"
)

# Snap classic packages
SNAP_CLASSIC_PACKAGES=(
    "code"
    "kubectx"
)

# Flatpak packages
FLATPAK_PACKAGES=(
    "org.videolan.VLC"
    "com.spotify.Client"
)

```

## Supported Distributions

1. Ubuntu/Debian-based
2. Fedora
3. Arch Linux/Manjaro
4. openSUSE


## Features in Detail

### Distribution Detection

- Automatically detects the Linux distribution
- Sets up appropriate package managers
- Configures necessary repositories

### Package Management

- Handles native package manager installations
- Manages Snap package installations (including classic confinement)
- Handles Flatpak installations
- Special handling for packages like Brave browser

### Logging
- Color-coded output for different message types
- Clear status messages
- Error reporting

## Contributing
- Fork the repository
- Create your feature branch (git checkout -b feature/amazing-feature)
- Commit your changes (git commit -m 'Add some amazing feature')
- Push to the branch (git push origin feature/amazing-feature)
- Open a Pull Request

## Known Issues

- Some package names might vary across distributions

## Future Improvements
- Add support for more distributions
- Implement package version checking
- Add rollback functionality
- Add configuration file validation
- Implement parallel installations where possible

## License

Coming Soon :)

## Acknowledgements
- Inspired by the need for automated system setup
- Thanks to the Linux community for package management tools

## Contact

Socials: 
    [LinkedIn](https://www.linkedin.com/in/abhishek-laha/),
    [Gmail](mailto:abhisheklaha199@gmail.com?)

Project Link: 
