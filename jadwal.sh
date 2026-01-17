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
echo "$RESPONSE" | jq -r --arg tanggal "$TANGGAL" '
if .status == true then
    .data.jadwal[$tanggal] as $jadwal |
    "Lokasi: \(.data.kabko), \(.data.prov)",
    "Tanggal: \($jadwal.tanggal)",
    "",
    "Jadwal Sholat:",
    "  Imsak  : \($jadwal.imsak)",
    "  Subuh  : \($jadwal.subuh)",
    "  Terbit : \($jadwal.terbit)",
    "  Dhuha  : \($jadwal.dhuha)",
    "  Dzuhur : \($jadwal.dzuhur)",
    "  Ashar  : \($jadwal.ashar)",
    "  Maghrib: \($jadwal.maghrib)",
    "  Isya   : \($jadwal.isya)"
else
    "Error: \(.message // "Gagal mengambil data")"
end
'

