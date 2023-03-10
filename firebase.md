cM9Aw4vN78sqG2VBCidaXO:APA91bFBegHpj9pskZI3BVw8GfMu7C5bQQFmrtRUOE5bwCMIdGPP7xVONkGND9BtT-AgxX-vEW9ds9XBkmmqS0OLxu6UWhGE10RtoTTFi07mdSgw2b266TrGykqR4XdgAD5St2QQxq-i


#curl



AAAAajFW3iA:APA91bGbK6NTJ3g68k_hY0oo8QLzp4vkGc4i9A0JDJU_yaRmjhdVoExuCCioCmxkZ2y47FfZvWjv01LSVVRAFy4f50GRIkFPScxmP4kYTosdsS6dYG1m0_PqtIw0n_jyzUSBvzFyoFm-


curl -X POST -H "Authorization: key=AAAAajFW3iA:APA91bGbK6NTJ3g68k_hY0oo8QLzp4vkGc4i9A0JDJU_yaRmjhdVoExuCCioCmxkZ2y47FfZvWjv01LSVVRAFy4f50GRIkFPScxmP4kYTosdsS6dYG1m0_PqtIw0n_jyzUSBvzFyoFm-" -H "Content-Type: application/json" -d '{
  "notification": {
    "title": "Jabarnews.com",
    "body": "Hallo ini berita pilihan tuk kamu hari ini, di baca ya",
    "icon": "firebase-logo.png",
    "click_action": "http://localhost:8081"
  },
  "to": "cM9Aw4vN78sqG2VBCidaXO:APA91bFBegHpj9pskZI3BVw8GfMu7C5bQQFmrtRUOE5bwCMIdGPP7xVONkGND9BtT-AgxX-vEW9ds9XBkmmqS0OLxu6UWhGE10RtoTTFi07mdSgw2b266TrGykqR4XdgAD5St2QQxq-i"
}' "https://fcm.googleapis.com/fcm/send"
