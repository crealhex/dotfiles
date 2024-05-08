#!/bin/bash

source "$(chezmoi source-path)/if-missing-utility.sh"

install_if_missing "curl" "Curl" "sudo apt install curl"

install_if_missing "unzip" "Unzip" "sudo apt install unzip"

echo "Setup completed successfully"
