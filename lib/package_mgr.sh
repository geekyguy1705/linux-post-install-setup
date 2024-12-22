#!/bin/bash

# Detect Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        DISTRO_VERSION=$VERSION_ID
        INFO="ID=$ID, VERSION=$VERSION_ID"
    else
        error_log "Cannot detect Linux distribution"
        exit 1
    fi
}

# Check and setup package managers
setup_package_managers() {
    case $DISTRO in
        "ubuntu"|"debian"|"pop"|"elementary")
            NATIVE_PKG_MGR="apt"
            if ! command_exists apt; then
                error_log "apt is not installed. This is unusual for $DISTRO."
                exit 1
            fi
            ;;
        "fedora")
            NATIVE_PKG_MGR="dnf"
            if ! command_exists dnf; then
                error_log "dnf is not installed. This is unusual for $DISTRO."
                exit 1
            fi
            ;;
        "arch"|"manjaro")
            NATIVE_PKG_MGR="pacman"
            if ! command_exists pacman; then
                error_log "pacman is not installed. This is unusual for $DISTRO."
                exit 1
            fi
            # Install yay for AUR access
            if ! command_exists yay; then
                log "Installing yay for AUR access..."
                sudo pacman -S --noconfirm base-devel
                git clone https://aur.archlinux.org/yay.git
                cd yay
                makepkg -si --noconfirm
                cd ..
                rm -rf yay
            fi
            ;;
        "opensuse")
            NATIVE_PKG_MGR="zypper"
            if ! command_exists zypper; then
                error_log "zypper is not installed. This is unusual for $DISTRO."
                exit 1
            fi
            ;;
        *)
            error_log "Unsupported distribution: $DISTRO"
            exit 1
            ;;
    esac

    # Setup Snap and Flatpak
    setup_snap
    setup_flatpak
}

setup_snap() {
    if ! command_exists snap; then
        log "Installing snap..."
        # Your existing snap setup code
    fi
}

setup_flatpak() {
    if ! command_exists flatpak; then
        log "Installing flatpak..."
        # Your existing flatpak setup code
    fi
}
