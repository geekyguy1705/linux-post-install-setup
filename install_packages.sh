#!/bin/bash
# set -x

# Source required files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default config location
DEFAULT_CONFIG="$SCRIPT_DIR/configs/packages.conf"
CONFIG_FILE=$DEFAULT_CONFIG

# Function to print usage
print_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  --config <file>    Use custom package configuration file"
    echo "  -h, --help         Show this help message"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --config)
            if [[ -n "$2" && -f "$2" ]]; then
                CONFIG_FILE="$2"
                shift 2
            else
                error_log "Error: Config file '$2' not found"
                print_usage
                exit 1
            fi
            ;;
        -h|--help)
            print_usage
            exit 0
            ;;
        *)
            error_log "Unknown option: $1"
            print_usage
            exit 1
            ;;
    esac
done

# Source required files
source "$SCRIPT_DIR/configs/packages.conf" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/utils.sh" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/package_mgr.sh" || echo "Error sourcing $file"
source "$SCRIPT_DIR/lib/installers.sh" || echo "Error sourcing $file"

# Main execution
main() {
    log "Starting package installation script..."
    log "Using config file: $CONFIG_FILE"
    
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
