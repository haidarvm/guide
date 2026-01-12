function ceksholat() {
    # ID Kota Bandung = 1219
    # Ganti ID ini jika ingin kota lain (lihat cara cari ID di bawah)
    local ID="1219" 
    local TANGGAL=$(date +"%Y-%m-%d")
    
    # Simpan respon ke variabel dulu untuk cek error
    local RESPON=$(curl -s "https://api.myquran.com/v3/sholat/jadwal/${ID}/${TANGGAL}")

    # Cek apakah respon berhasil (status: true)
    if echo "$RESPON" | grep -q '"status":true'; then
        echo "$RESPON" | jq -r '
          .data.jadwal | 
          "=======================",
          "   JADWAL SHOLAT",
          "   \(.tanggal)",
          "=======================",
          "Subuh   : \(.subuh)",
          "Dzuhur  : \(.dzuhur)",
          "Ashar   : \(.ashar)",
          "Maghrib : \(.maghrib)",
          "Isya    : \(.isya)",
          "======================="
        '
    else
        echo "Gagal mengambil data. Pastikan koneksi internet lancar atau ID Kota benar."
        # Debugging: Tampilkan pesan error asli dari API jika perlu
        # echo "$RESPON" | jq . 
    fi
}
