#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config

# awway of dotfiles; feew fwee to add youw dotfiles hewe with the wight souwce path
declare -A DOTFILES
DOTFILES=(
    [neofetch]="$CONFIG_DIR/neofetch"
    [kvantum]="$CONFIG_DIR/Kvantum"
)

# check if dotfile diwectowy exist
mkdir -p "$DOTFILES_DIR"

for key in "${!DOTFILES[@]}"; do
    TARGET="${DOTFILES[$key]}"
    SOURCE="$DOTFILES_DIR/$(basename "$TARGET")"

    echo "DOTFILE: $key"
    echo "FROM: $TARGET"
    echo "TO: $SOURCE"

    # check if dotfile alweady exist
    mkdir -p "$(dirname "$SOURCE")"

    # skip loop if alweady symlinked (pwevent bweaking my systuwm)
    if [ -L "$TARGET" ]; then
        echo "$key is already symlinked uwu"
        continue
    fi

    # move existing file if it's not symlinked together because they were meant to be together <3
    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        mv "$TARGET" "$SOURCE"
    fi

    # # cweate symwink
    ln -s "$SOURCE" "$TARGET"
    
    echo "$key configuwation compweted! <3"
done