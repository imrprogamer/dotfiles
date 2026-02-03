#!/bin/bash

set -e

echo "🚀 Starting system setup..."

# =========================
# 1) تحديث النظام
# =========================
echo "🔄 Updating system..."
sudo pacman -Syu --noconfirm

# =========================
# 2) تثبيت البرامج الأساسية
# =========================
echo "📦 Installing base packages..."

sudo pacman -S --needed --noconfirm \
  git \
  kitty \
  fastfetch \
  rsync \
  neofetch \
  base-devel \
  curl \
  wget

# =========================
# 3) استنساخ kitty themes
# =========================
KITTY_THEMES_DIR="$HOME/.config/kitty/kitty-themes"

if [ ! -d "$KITTY_THEMES_DIR" ]; then
  echo "🎨 Cloning kitty-themes..."
  git clone https://github.com/dexpota/kitty-themes.git "$KITTY_THEMES_DIR"
else
  echo "🎨 kitty-themes already exists, skipping..."
fi

# =========================
# 4) استرجاع dotfiles
# =========================
if [ -f "./restore.sh" ]; then
  echo "🛠 Restoring dotfiles..."
  chmod +x restore.sh
  ./restore.sh
else
  echo "⚠️ restore.sh not found!"
fi

# =========================
# 5) fish shell (اختياري)
# =========================
if command -v fish >/dev/null 2>&1; then
  echo "🐟 fish already installed"
else
  sudo pacman -S --noconfirm fish
fi

# =========================
# 6) إنهاء
# =========================
echo ""
echo "✅ Installation complete!"
echo "🔁 Reboot is recommended."
