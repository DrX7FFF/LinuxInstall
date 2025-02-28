#!/bin/bash

# 📌 CONFIGURATION PARAMÉTRABLE
SRC="/media/moi/HDTemp"
DST="/media/moi/HD1/Films"
SSD_TMP="/home/moi/ssd_tmp"
LOGFILE="copie_erreurs.log"

# Créer les dossiers si besoin
mkdir -p "$SSD_TMP" "$DST"

trap 'echo "Arrêt du script"; exit' SIGINT

for file in "$SRC"/*; do
    filename=$(basename "$file")
    dest_file="$DST/$filename"

    # Vérifier si le fichier existe déjà
    if [[ -e "$dest_file" ]]; then
        src_size=$(stat -c %s "$file")
        dest_size=$(stat -c %s "$dest_file")
        src_mtime=$(stat -c %Y "$file")
        dest_mtime=$(stat -c %Y "$dest_file")

        # Ignorer si la taille et la date sont identiques
        if [[ "$src_size" -eq "$dest_size" && "$src_mtime" -le "$dest_mtime" ]]; then
            echo "🔹 Ignoré (déjà copié) : $filename"
            continue
        fi

        echo "♻️ Remplacement : $filename"
    fi

    TMP_PATH="$SSD_TMP/$filename"
    echo "📥 Copie de : $filename"

    # Copie vers l'espace temporaire
    rsync -a --info=progress2 "$file" "$TMP_PATH"
    if [[ $? -ne 0 ]]; then
        echo "❌ Erreur de copie : $file" | tee -a "$LOGFILE"
        continue
    fi
    # sync

    # Déplacement final
    rsync -a --fsync --remove-source-files --info=progress2 "$TMP_PATH" "$DST"
    if [[ $? -ne 0 ]]; then
        echo "❌ Erreur de déplacement : $TMP_PATH" | tee -a "$LOGFILE"
        continue
    fi
    # sync
    echo "✅ Copie réussie : $filename"
done


# Nettoyage des fichiers temporaires
echo "🧹 Nettoyage de SSD_TMP..."
rm -rf "$SSD_TMP"/*

echo "📌 Copie terminée ! Erreurs (si présentes) dans $LOGFILE"
