#!/bin/bash
set -e

sudo apt update

# Installs a package if it is not already installed
# Usage: install_if_missing <command-to-check> <package-name> <install-command>
install_if_missing() {
    local command_to_check="$1"
    local package_name="$2"
    local install_command="$3"

    if ! command -v $command_to_check &> /dev/null; then
        echo "$package_name not found. Installing..."
        eval $install_command
    else
        echo "$package_name already installed."
    fi
}
