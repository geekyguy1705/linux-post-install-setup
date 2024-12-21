#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to log messages
log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn_log() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error_log() {
    echo -e "${RED}[ERROR]${NC} $1"
}
