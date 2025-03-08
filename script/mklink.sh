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
    [bash]="$HOME/.bashrc"
)

for key in "${!DOTFILES[@]}"; do
    TARGET="${DOTFILES[$key]}"
    SOURCE="$DOTFILES_DIR/$key"
    IS_FILE=false

    # check if it's a single file or directory
    if [ -f "$TARGET" ]; then
        FILENAME="$(basename "$TARGET")"
        IS_FILE=true
    fi

    # backup existing config if it's not symlinked, to ensure safe delivery~
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then     
        echo "Backing up your $key to $BACKUP_DIR"
        mv "$TARGET" "$BACKUP_DIR"
    fi

    if [ -L "$TARGET" ]; then
        echo "$key has existing symlink, this will be ignored"
        continue
    fi

    if [ "$IS_FILE" = true ]; then
        ln -s "$SOURCE/$FILENAME" "$TARGET"
    else
        ln -s "$SOURCE" "$TARGET"
    fi
done

echo "autistic config applied <3"