#!/bin/bash

source "$(chezmoi source-path)/if-missing-utility.sh"

# Install Neovim
install_if_missing "nvim" "Neovim" "sudo snap install --beta nvim --classic"

# Install Ripgrep
install_if_missing "rg" "Ripgrep" "sudo apt install ripgrep"

echo "Setup completed successfully"
