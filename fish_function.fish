# 1. Quran & Downloads
function quran
    python3 /var/www/play/py/quran.py $argv[1] $argv[2]
end

function quran_dl
    aria2c "https://everyayah.com/data/Alafasy_128kbps/$argv[1].mp3"
end

function quran_dl_indo
    aria2c "https://dn721906.ca.archive.org/0/items/AlQuran-terjemahan-indonesia-tanpa-bahasa-arab/$argv[1].mp3"
end

# 2. File Searching
function fin
    find . -iname "*$argv[1]*"
end

# 3. Gabung MP3 (Perhatikan perbedaan manipulasi array)
function gabungmp3
    # Output adalah argumen terakhir
    set output $argv[-1]
    # Input adalah semua argumen kecuali yang terakhir
    set inputs $argv[1..-2]
    
    # Fish menggabungkan array dengan string join
    set joined_inputs (string join "|" $inputs)
    
    ffmpeg -i "concat:$joined_inputs" -codec:a libmp3lame -q:a 0 "$output"
end

# 4. Containers & Git
function po
    sudo podman exec -w /root -it $argv[1] /bin/bash
end

function gc
    git clone git@github.com:$argv[1]/$argv[2].git
end

# 5. Benchmarking
function wk
    wrk -t12 -c400 -d5s "http://$argv[1]"
end

# 6. Unmount & Power Off Harddisk
function unhd
    set disk "/dev/$argv[1]"
    
    if test -z "$argv[1]"
        echo "Gunakan: unhd sdb"
        return 1
    end

    echo "Melepas semua partisi di $disk..."
    
    # lsblk output diproses untuk unmount
    for part in (lsblk -ln -o NAME $disk)
        udisksctl unmount -b /dev/$part 2>/dev/null
    end

    echo "Mematikan daya drive $disk..."
    if udisksctl power-off -b $disk
        echo "Berhasil! Harddisk aman dicabut."
    else
        echo "Gagal mematikan daya. Pastikan tidak ada file yang sedang terbuka."
    end
end

# 7. Replace Text
function rep
    sudo sed -i "s/$argv[1]/$argv[2]/g" $argv[3]
end

# 8. Cek Jadwal Sholat
function ceksholat
    set ID "eda80a3d5b344bc40f3bc04f65b7a357"
    set TANGGAL (date +"%Y/%m/%d")
    set URL "https://api.myquran.com/v3/sholat/jadwal/$ID/$TANGGAL"

    curl -s "$URL" | jq -r '
      if .status == false then
        "Error: \(.message)"
      else
        .data.jadwal | 
        "=======================",
        "   JADWAL SHOLAT",
        "   \(.tanggal // "Tanggal Tidak Ditemukan")",
        "=======================",
        "Subuh   : \(.subuh)",
        "Dzuhur  : \(.dzuhur)",
        "Ashar   : \(.ashar)",
        "Maghrib : \(.maghrib)",
        "Isya    : \(.isya)",
        "======================="
      end
    '
end
