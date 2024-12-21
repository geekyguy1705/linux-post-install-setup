#!/bin/bash

# Install brave browser
install_brave_browser() {
    log "Installing Brave browser..."
    curl -fsS https://dl.brave.com/install.sh | sh
}

# Install packages using native package manager
install_native_packages() {
    case $NATIVE_PKG_MGR in
        "apt")
            log "Updating apt repositories..."
            sudo apt update
            for package in "${NATIVE_PACKAGES[@]}"; do
                if [ "$package" = "brave-browser" ]; then
                    install_brave_browser
                else
                    log "Installing $package via apt..."
                    sudo apt install -y "$package" || error_log "Failed to install $package"
                fi
            done
            ;;
        # Other package managers...
    esac
}

# Install snap packages
install_snap_packages() {
    for package in "${SNAP_PACKAGES[@]}"; do
        log "Installing $package via snap..."
        sudo snap install "$package" || error_log "Failed to install $package"
    done
}

install_snap_classic_packages() {
    for package in "${SNAP_CLASSIC_PACKAGES[@]}"; do
        log "Installing $package via snap (classic)..."
        sudo snap install "$package" --classic || error_log "Failed to install $package"
    done
}

# Install flatpak packages
install_flatpak_packages() {
    for package in "${FLATPAK_PACKAGES[@]}"; do
        log "Installing $package via flatpak..."
        sudo flatpak install -y flathub "$package" || error_log "Failed to install $package"
    done
}
