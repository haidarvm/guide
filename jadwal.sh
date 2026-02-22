#!/bin/bash

# Script untuk mengambil jadwal sholat dari API MyQuran
# Penggunaan: ./jadwal_sholat.sh [tanggal]
# Format tanggal: YYYY-MM-DD (opsional, default: hari ini)

# Kode kota (contoh: fc221309746013ac554571fbd180e1c8)
KOTA_ID="fc221309746013ac554571fbd180e1c8"

# Gunakan tanggal dari parameter atau tanggal hari ini
if [ -z "$1" ]; then
    TANGGAL=$(date +%Y-%m-%d)
else
    TANGGAL="$1"
fi

# URL API
API_URL="https://api.myquran.com/v3/sholat/jadwal/${KOTA_ID}/${TANGGAL}"

echo "Mengambil jadwal sholat untuk tanggal: $TANGGAL"
echo "================================================"

# Cek apakah jq terinstall
if ! command -v jq &> /dev/null; then
    echo "Error: jq tidak terinstall"
    echo "Install dengan: sudo apt install jq (Ubuntu/Debian) atau sudo yum install jq (CentOS/RHEL)"
    exit 1
fi

# Ambil data dari API
RESPONSE=$(curl -s "$API_URL")
# Cek apakah response kosong
if [ -z "$RESPONSE" ]; then
    echo "Error: Tidak dapat mengambil data dari API"
    exit 1
fi

# Tampilkan hasil dengan format yang rapi
# ... (kode sebelumnya tetap sama sampai baris 38)

# Ambil waktu Maghrib dari JSON
MAGHRIB=$(echo "$RESPONSE" | jq -r ".data.jadwal.\"$TANGGAL\".maghrib")

if [ "$MAGHRIB" == "null" ] || [ -z "$MAGHRIB" ]; then
    echo "Gagal mengambil waktu Maghrib."
    exit 1
fi

# Tampilkan Jadwal (Sama seperti sebelumnya)
echo "$RESPONSE" | jq -r --arg tanggal "$TANGGAL" '
    .data.jadwal[$tanggal] as $j |
    "Lokasi: \(.data.kabko)\nTanggal: \($j.tanggal)\n\nJadwal:\n Imsak  : \($j.imsak)\n Subuh  : \($j.subuh)\n Dzuhur : \($j.dzuhur)\n Ashar  : \($j.ashar)\n Maghrib: \($j.maghrib)\n Isya   : \($j.isya)"
'

# --- LOGIKA HITUNG MUNDUR (TIMEDIFF) ---
NOW_EPOCH=$(date +%s)
MAGHRIB_EPOCH=$(date -d "$TANGGAL $MAGHRIB" +%s)
DIFF=$(( MAGHRIB_EPOCH - NOW_EPOCH ))

echo "------------------------------------------------"

if [ $DIFF -gt 0 ]; then
    HOURS=$(( DIFF / 3600 ))
    MINS=$(( (DIFF % 3600) / 60 ))
    echo "Menuju Maghrib (Buka Puasa): $HOURS jam $MINS menit lagi."
    
    # Contoh command untuk adzan otomatis (opsional)
    # Anda bisa menggunakan 'at' command atau loop 'sleep'
elif [ $DIFF -le 0 ] && [ $DIFF -gt -3600 ]; then
    echo "Selamat berbuka puasa! Waktu Maghrib sudah tiba."
else
    echo "Waktu Maghrib sudah lewat untuk hari ini."
fi
