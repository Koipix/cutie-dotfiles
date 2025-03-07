#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config
LOCAL_DIR=~/.local
BACKUP_DIR=~/dotfiles_backup

mkdir -p "$BACKUP_DIR"
mkdir -p "$DOTFILES_DIR"

# awway of dotfiles; feew fwee to add youw dotfiles hewe with the wight souwce path
declare -A DOTFILES

DOTFILES=(
    [neofetch]="$CONFIG_DIR/neofetch"
    [Kvantum]="$CONFIG_DIR/Kvantum"
    [konsole]="$LOCAL_DIR/share/konsole"
)

for key in "${!DOTFILES[@]}"; do
    TARGET="${DOTFILES[$key]}"
    SOURCE="$DOTFILES_DIR/$key"

    # check if dotfile alweady exist othewise cweate the folder
    mkdir -p "$(dirname "$SOURCE")"

    # skip woop if alweady symlinked (pwevent bweaking my systuwm)
    if [ -L "$TARGET" ]; then
        echo "Replacing your config for $key"
        rm "$TARGET"
    fi

    # backup existing config if it's not symlinked, to ensure safe delivery~
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        mv "$TARGET" "$BACKUP_DIR/"
        echo "Backed up $key to $BACKUP_DIR"
    fi

    # cweate symwink because they were meant to be together <3
    ln -s "$SOURCE" "$TARGET"
    echo "$key configuwation compweted!"
done

echo "autistic config applied <3"