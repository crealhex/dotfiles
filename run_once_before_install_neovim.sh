#!/bin/bash

set -e

if ! command -v nvim &> /dev/null; then
    echo "Neovim not found. Installing Neovim..."
    sudo snap install --beta nvim --classic
else
    echo "Neovim already installed"
fi

if ! command -v ripgrep &> /dev/null; then
    echo "RipGrep not found. Installing RipGrep..."
    sudo apt install ripgrep
else
    echo "RipGrep already installed"
fi

echo "Setup completed successfully"
