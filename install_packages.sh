#!/bin/bash
# set -x

# Source required files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "SCRIPT_DIR: $SCRIPT_DIR"
source "$SCRIPT_DIR/configs/packages.conf" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/utils.sh" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/package_mgr.sh" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/installers.sh" || echo "Error sourcing $file"

# Main execution
main() {
    log "Starting package installation script..."
    
    # Check for sudo privileges
    if [ "$EUID" -ne 0 ]; then 
        log "Please note: This script requires sudo privileges for installation"
    fi

    # Detect distribution
    detect_distro
    log "Detected distribution: $DISTRO"

    # Setup package managers
    setup_package_managers

    # Run installations
    install_native_packages
    install_snap_packages
    install_snap_classic_packages
    install_flatpak_packages

    log "Installation process completed!"
}

# Run the script
main
