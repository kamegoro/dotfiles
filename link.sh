#!/bin/sh

dotfiles_root=$(cd $(dirname $0)/.. && pwd)
ignore_file="${dotfiles_root}/dotfiles/.ignore"

if [ -f "$ignore_file" ]; then
    ignore_list=$(cat "$ignore_file")
else
    ignore_list=""
fi

create_symlink() {
    src=$1
    dest=$2

    if [ -e "$dest" ]; then
        echo "Skipped $dest (already exists)"
    else
        ln -s "$src" "$dest"
        echo "Linked $src to $dest"
    fi
}

for item in ${dotfiles_root}/dotfiles/.*; do
    [ "$item" = "${dotfiles_root}/dotfiles/." ] || [ "$item" = "${dotfiles_root}/dotfiles/.." ] && continue

    item_name=$(basename "$item")

    if echo "$ignore_list" | grep -qx "$item_name"; then
        echo "Ignored $item_name (specified in .ignore)"
        continue
    fi

    if [ "$item_name" = ".config" ]; then
        mkdir -p ${HOME}/.config
        for config_item in "$item"/*; do
            config_name=$(basename "$config_item")
            if echo "$ignore_list" | grep -qx "$config_name"; then
                echo "Ignored $config_name (specified in .ignore)"
                continue
            fi
            create_symlink "$config_item" "${HOME}/.config/$config_name"
        done
    else
        create_symlink "$item" "${HOME}/$item_name"
    fi
done

