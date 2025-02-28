#!/bin/bash

SRC="/media/moi/HD1/Films/Temp"
DST="/media/moi/HDTemp"

# Comparer les fichiers source et destination
for file in "$SRC"/*; do
    filename=$(basename "$file")
    dest_file="$DST/$filename"

    if [[ -e "$dest_file" ]]; then
        # Obtenir les dates de modification du fichier source
        src_mtime=$(stat -c %Y "$file")
        src_atime=$(stat -c %X "$file")

        # Rétablir les dates de modification et d'accès du fichier destination
        touch -d "@$src_mtime" -a -m "$dest_file"
        echo "📅 Dates rétablies : $filename"
    fi
done

echo "✅ Rétablissement des dates terminé !"
