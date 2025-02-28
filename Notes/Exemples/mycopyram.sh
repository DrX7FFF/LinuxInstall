#!/bin/bash

# 📌 CONFIGURATION PARAMÉTRABLE
SRC="/media/moi/HDTemp"
DST="/media/moi/HD1/Films"
RAMDISK="/home/moi/ramdisk"
SSD_TMP="/home/moi/ssd_tmp"
RAMDISK_SIZE_GB=25   # Taille du RAMDisk (en Go)
LOGFILE="copie_erreurs.log"

# Convertir en octets
RAMDISK_SIZE=$((RAMDISK_SIZE_GB * 1024 * 1024 * 1024))

# Créer les dossiers si besoin
mkdir -p "$RAMDISK" "$SSD_TMP" "$DST"

# Monter le RAMDisk dynamiquement
sudo mountpoint -q "$RAMDISK" || sudo mount -t tmpfs -o size=${RAMDISK_SIZE_GB}G tmpfs "$RAMDISK"

echo "🚀 RAMDisk alloué : ${RAMDISK_SIZE_GB} Go"

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

    size=$(stat -c %s "$file")

    # Déterminer la destination temporaire selon la taille
    if [[ $size -lt $RAMDISK_SIZE ]]; then
        TMP_PATH="$RAMDISK/$filename"
        echo "📥 Copie en RAMDisk : $filename"
    else
        TMP_PATH="$SSD_TMP/$filename"
        echo "📥 Copie sur SSD temporaire : $filename"
    fi

    # Copie vers l'espace temporaire
    # cp "$file" "$TMP_PATH"
    # rsync -a --progress --info=progress2 "$file" "$TMP_PATH"
    rsync -a --info=progress2 "$file" "$TMP_PATH"
    if [[ $? -ne 0 ]]; then
        echo "❌ Erreur de copie : $file" | tee -a "$LOGFILE"
        continue
    fi
    sync

    # Déplacement final
    # mv "$TMP_PATH" "$DST"
    # rsync -a --progress --remove-source-files --info=progress2 "$TMP_PATH" "$DST"
    rsync -a --remove-source-files --info=progress2 "$TMP_PATH" "$DST"
    if [[ $? -ne 0 ]]; then
        echo "❌ Erreur de déplacement : $TMP_PATH" | tee -a "$LOGFILE"
        continue
    fi
    sync
    echo "✅ Copie réussie : $filename"
done

# Démonter le RAMDisk proprement
echo "🚀 Démontage du RAMDisk..."
sudo umount "$RAMDISK"

# Nettoyage des fichiers temporaires
echo "🧹 Nettoyage du RAMDisk et SSD_TMP..."
rm -rf "$RAMDISK"/*
rm -rf "$SSD_TMP"/*

echo "📌 Copie terminée ! Erreurs (si présentes) dans $LOGFILE"
