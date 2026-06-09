#!/usr/bin/env bash
set -euo pipefail

echo "Checking Homebrew..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load Homebrew into this shell session for Apple Silicon or Intel Macs
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Updating Homebrew..."
brew update

echo "Installing CLI tools..."
brew install \
  bat \
  fzf \
  neovim \
  git \
  tmux \
  stow \
  python@3.12 \
  ripgrep \
  zsh-syntax-highlighting

echo "Installing tpm for tmux"
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing AeroSpace..."
brew install --cask nikitabobko/tap/aerospace

echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh already installed, skipping."
fi

echo "Adding zsh-syntax-highlighting to ~/.zshrc..."
ZSH_HIGHLIGHTING_LINE='source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

if ! grep -q "zsh-syntax-highlighting.zsh" "$HOME/.zshrc" 2>/dev/null; then
  echo "" >> "$HOME/.zshrc"
  echo "# zsh-syntax-highlighting" >> "$HOME/.zshrc"
  echo "$ZSH_HIGHLIGHTING_LINE" >> "$HOME/.zshrc"
else
  echo "zsh-syntax-highlighting already configured, skipping."
fi

echo "Setting zsh as default shell..."
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh || true
fi

echo "Installing Fonts"
mkdir -p "$HOME/Library/Fonts"
find "$PWD/fonts" -type f \( -iname '*.ttf' -o -iname '*.otf' \) -exec cp -n {} "$HOME/Library/Fonts"/ \;

echo "Stowing dotfiles..."
stow nvim
stow tmux
echo "Stowing zsh config..."

if [ -e "$HOME/.zshrc" ] || [ -L "$HOME/.zshrc" ]; then
  echo "Removing existing ~/.zshrc..."
  rm -f "$HOME/.zshrc"
fi
stow zsh

stow aerospace

echo "Done."
echo "Restart your terminal, then test:"
echo "  nvim --version"
echo "  tmux -V"
echo "  stow --version"
echo "  python3.12 --version"
echo "  rg --version"
echo "  aerospace --version"
echo "  echo \$SHELL"

echo "For tmux to work, please open a tmux session then Ctrl a + I then source tmux config file"
