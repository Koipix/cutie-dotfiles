#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config
BACKUP_DIR=~/dotfiles_backup

mkdir -p "$BACKUP_DIR"
mkdir -p "$DOTFILES_DIR"

declare -A DOTFILES

DOTFILES=(
    [neofetch]="$CONFIG_DIR/neofetch"
    [Kvantum]="$CONFIG_DIR/Kvantum"
)

for key in "${!DOTFILES[@]}"; do
    TARGET="${DOTFILES[$key]}"
    BACKUP="$BACKUP_DIR/$(basename "$TARGET")"

    if [ -L "$TARGET" ]; then
        echo "Removing symwink for $key.."
        rm "$TARGET"
    else
        echo "$key is not symwinked, skipping.."
        continue
    fi

    if [ -e "$BACKUP" ]; then
        echo "Restoring your $key from backup"
        mv "$BACKUP" "$TARGET"
    else 
        echo "No backup found $key, silly!"
    fi
done

echo "Restore compweted! You might want to reboot to start over~"