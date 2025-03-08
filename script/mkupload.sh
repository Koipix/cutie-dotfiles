#!/bin/bash

DOTFILES_DIR=~/dotfiles
CONFIG_DIR=~/.config
LOCAL_DIR=~/.local

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

    # check if dotfile alweady exist othewise cweate the folder
    mkdir -p "$(dirname "$SOURCE")"

    #if linked, skip
    if [ -L "$TARGET" ]; then
        echo "$key already exist"
        continue
    fi

    if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
        #if directory
        if [ -d "$TARGET" ]; then
            mkdir -p "$SOURCE"
            mv "$TARGET" "$SOURCE"
            echo "Moved folder config $key to $SOURCE"

             # cweate symwink because they were meant to be together <3
            ln -s "$SOURCE" "$TARGET"
        else
            mkdir -p "$SOURCE"
            mv "$TARGET" "$SOURCE/"
            echo "Moved file config $key to $SOURCE"

            # create symlink to file itself
            ln -s "$SOURCE/$(basename "$TARGET")" "$TARGET"
        fi
    fi

    echo "$key configuwation compweted!"
done

echo "autistic config uploaded <3"