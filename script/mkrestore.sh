#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config
LOCAL_DIR=~/.local
BACKUP_DIR=~/dotfiles_backup

mkdir -p "$BACKUP_DIR"
mkdir -p "$DOTFILES_DIR"

declare -A DOTFILES

DOTFILES=(
    [neofetch]="$CONFIG_DIR/neofetch"
    [Kvantum]="$CONFIG_DIR/Kvantum"
    [konsole]="$LOCAL_DIR/share/konsole"
    [bash]="$HOME/.bashrc"
)

for key in "${!DOTFILES[@]}"; do
    TARGET="${DOTFILES[$key]}"
    BACKUP="$BACKUP_DIR/$(basename "$TARGET")"

    if [ -e "$BACKUP" ] && [ -L "$TARGET" ]; then
        echo "Cleaning symlink for $key.."
        rm "$TARGET"
    else
        echo "$key backup doesn't exist, skipping.."
        continue
    fi

    if [ -e "$BACKUP" ]; then
        echo "Restoring your $key from backup"
        mv "$BACKUP" "$TARGET"
    fi
done

echo "Restore completed! You might want to logout to refresh~"