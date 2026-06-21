#!/usr/bin/env bash
set -euo pipefail

echo "Installing Emacs..."
brew install emacs --y
brew tap d12frosted/emacs-plus
brew install --cask emacs-plus-app
