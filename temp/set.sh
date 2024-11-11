#!/bin/bash

# Nama file konfigurasi
CONFIG_FILE=".env"

# Cek apakah file konfigurasi sudah ada
if [ -f "$CONFIG_FILE" ]; then
    # Jika file ada, tanyakan kepada pengguna
    read -p "Apakah kamu ingin mengganti email ? (y/n): " choice
    if [ "$choice" != "y" ]; then
        echo "Menggunakan email yang sudah ada."
        exit 0
    fi
fi

# Jika file belum ada, atau pengguna memilih untuk membuat file baru

# Meminta input dari pengguna untuk MAIL dan PW
read -p "Masukkan MAIL: " MAIL
read -p "Masukkan PW: " PW
read -p "Masukan Key: " KEY

# Menyimpan MAIL dan PW ke file config.env
echo "MAIL=$MAIL
PW=$PW
KEY=$KEY
" > "$CONFIG_FILE"

echo "Email $MAIL dengan pw $PW telah disimpan database local"
