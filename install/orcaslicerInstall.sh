#! /bin/bash

# Correction référence lib manquante libwebkit2gtk-4.0.so.37
sudo ln -sf /usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.1.so.0 /usr/lib/x86_64-linux-gnu/libwebkit2gtk-4.0.so.37
sudo ln -sf /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.1.so.0 /usr/lib/x86_64-linux-gnu/libjavascriptcoregtk-4.0.so.18

# Correction paramètre régionaux manquant
sudo locale-gen en_GB
sudo locale-gen en_GB.UTF-8

# Affichage
locale -a