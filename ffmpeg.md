ffmpeg -i modernHousePreview.avi -s 1280x720 -c:a copy modernHousePreview.mp4

# resize 360

ffmpeg -i 45NoSupers_1_smalls.mp4 -s 426x240 -c:a copy -strict -2 45NoSupers_1_small240.mp4

# whatsapp
ffmpeg -i houseFailedRotate.mkv -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p houseFailedRotate.mp4

ffmpeg -i houseWorksRotate.mkv -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p houseWorksRotate.mp4



ffmpeg -i MeningkatkanKecerdasan.avi -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p MeningkatkanKecerdasan.mp4


ffmpeg -i modernHousePreview.avi -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p modernHousePreview.mp4

ffmpeg -i finalfinalfinalfinal.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p finalfinalfinalfinalSmall.mp4

ffmpeg -i agusMeet2.mkv -s 480x270 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p agusMeetUiUx.mp4      
ffmpeg -i rhelZ230Demo500gb.mkv -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p rhelZ230Demo500gb.mp4

ffmpeg -i 45NoSupers_1_small.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p 45NoSupers_1_smalls.mp4


-c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p 

ffmpeg -i jajah.avi -s 1920x1080 -c:a copy jajah2.mkv
ffmpeg -i jajah.avi -s 1920x1080 -c:a copy jajah2.mkv
ffmpeg -i bumperOutroTL.avi -c:a copy bumperOutroTL.mp4

ffmpeg -i bumperOutroTL.avi -c:v libx264 -c:a aac -strict experimental bumperOutroTL.mp4

# combine two vid
$ cat files.txt
file 'file 1.mkv'
file 'file 2.mkv'
file 'file 3.mkv'
file 'file 4.mkv'
ffmpeg -f concat -safe 0 -i files.txt -c copy output.mkv

# remove sound
ffmpeg -i VID20210602153511.mp4 -c copy -an VID20210602153511_no_sound.mp4

# loop sound
sox bensound-creativeminds.mp3 looped_bensound-creativeminds_loops.mp3 repeat 50
ffmpeg -i VID20210602153511_no_sound.mp4 -i bensound-creativeminds_loops.mp3 -shortest VID20210602153511_free_music.mp4

#soundOnly
ffmpeg -i finalEditingTanahLandTemp.mp4 -acodec copy  finalEditingTanahLandTemp.aac
ffmpeg  -i faisalvkangIrfanSp.mkv -acodec copy    -to 00:08:09 faisalvkangIrfanSp.aac
ffmpeg -i faisalvkangIrfanSp.aac -map 0:a:0 -b:a 96k faisalvkangIrfanSp.mp3

GundalaNegeriIniButuhPatriot
Tenang, nanti muncul sosok Gundala di Negeri Ini Butuh Patriot
https://t.me/c/1119791486/144138

#mkvToMp4
ffmpeg -i documentaryBandungMuslimAnimator3small-o3ytByGFPcU.mkv -s 1280x720 -c:a copy documentaryBandungMuslimAnimator3small-o3ytByGFPcU.mp4


ffmpeg -i rs_sh_40001-0154.avi -s 1280x720 -c:a copy rs_sh4.mp4

ffmpeg -i sepedaMotorListrikGesits.mp4 -s 1280x720 -c:a copy sepedaMotorListrikGesits2.mp4

ffmpeg -i part00001-0230.avi -s 1280x720 -c:a copy part0.mp4

ffmpeg -i unlaprofile.mp4 -s 1280x720 -c:a copy unlaprofiles.mp4

ffmpeg -i doliving.mp4 -s 640x480 -c:a copy dolivings.mp4

#Yayan Ruhian petarung silat terhebat se Indonesia, Music Score By Mike Shinoda (LinkinPark), Directed By Gareth Evans (The Raid Redemption)
ffmpeg -i TheRaidRedemption95KhOcXR1OA.mkv -s 480x270 -c:a copy -strict -2 TheRaidRedemption95KhOcXR1OA.mp4

#to davinci
ffmpeg -i input.mp4 -c:v dnxhd -profile:v dnxhr_hq output.mov
ffmpeg -i limp.mp4  -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le limp.mov
ffmpeg -i limp.mp4 -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a pcm_s16le limp.mov
ffmpeg -i tanah.mp4  -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le tanah.mov                     
ffmpeg -i finalEditingTanahLandTemp.mp4  -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le finalEditingTanahLandTemp.mov

ffmpeg -i tanah.mp4  -c:v dnxhd -profile:v dnxhr_hq -c:a pcm_s16le tanah.mov                     

#replace audio
ffmpeg -i input_video.mp4 -i replacement_audio.m4a -vcodec copy -acodec copy -map 0:0 -map 1:0 output.mp4     
ffmpeg -i tutorInputIdKei.mp4 -i audioKei.ac3 -vcodec copy -acodec copy -map 0:0 -map 1:0 tutorInputIdKeiR.mp4

#crop video from start to
ffmpeg -ss 00:00:01 -i tutorInputIdKeiR.mp4 -to 00:00:31 -c copy tutorInputIdKeiRs.mp4

#format for WA whatsapp
ffmpeg -i tutorInputIdKeiRs.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p tutorInputIdKeiRse.mp4
ffmpeg -i finalPonWIP2016.mkv -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p finalPonWIP2016.mp4
ffmpeg -i 0608finalTreniBotBlender3DAnimation-ZKBzHRNX890.mp4 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p 0608finalTreniBotBlender3DAnimation.mp4

ffmpeg -i rammsteinAmerika.mkv -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p rammsteinAmerika.mp4

ffmpeg -ss 00:00:01 -i HaidarvmNonPointTFrabia.mp4 -to 00:03:31 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p HaidarvmNonPointTFrabia2.mp4

ffmpeg -i THERAID2MovieClip_KitchenFightScene2014-hwZ1G9fKPI8.mkv -s 640x480 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p THERAID2MovieClip_KitchenFightScene2014-hwZ1G9fKPI8.mp4 


ffmpeg -i LimpBizkitEatYouAliveOfficialVideo_Cb24kLd459Y.mkv -s 640x480 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p LimpBizkitEatYouAliveOfficialVideo_Cb24kLd459Y.mp4 



ffmpeg -i JohnWickChapter3Parabellum2019ShinobiAssassinFightScene9_12MovieclipsBUqJMPAtmdY.mkv -s 640x480 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p JohnWickChapter3Parabellum2019ShinobiAssassinFightScene9_12MovieclipsBUqJMPAtmdY.mp4 

##crop blackscreen
ffplay -vf "crop = 640:480:200:100" dolivings.mp4
ffmpeg -i dolivings.mp4  -vf "crop = 640:480:200:100" -c:a copy dolivingsb.mp4


ffmpeg -i SHOWREELLIVINGIMAGINATION-vTgx0El4LdU.mkv -s 1920x1080 -c:a copy -strict -2 SHOWREELLIVINGIMAGINATION-vTgx0El4LdU.mp4


ffmpeg -i komjenPolDharmaPongrekunDesainGlobalmiripkerjaIBLISviaPropagandaKETAKUTANSbagaiKontrol-2dInoRRSlY8.webm -s 480x270 -c:a copy -strict -2 komjenPolDharmaPongrekunDesainGlobalmiripkerjaIBLISviaPropagandaKETAKUTANSbagaiKontrol-2dInoRRSlY8.mp4



ffmpeg -i DOPAMINE_DETOX-RESET_OTAK-HALAU_MALAS-kO622GyHa28.webm -s 480x270 -c:a copy -strict -2 DOPAMINE_DETOX-RESET_OTAK-HALAU_MALAS-kO622GyHa28.mp4

ffmpeg -i 0608finalTreniBotBlender3DAnimation-ZKBzHRNX890.mkv -s 1920x1080 -c:a copy -strict -2 0608finalTreniBotBlender3DAnimation-ZKBzHRNX890.mp4


ffmpeg -i bagasCimahiBandungSyari.mp4 -s 480x480 -c:a copy bagasCimahiBandungSyarie2.mp4

ffmpeg -i 2020-10-31-204301.webm -s 480x480 -c:a copy 2020-10-31-204301.mp4

ffmpeg -i mie.webm -s 360x270 -c:a copy -strict -2 mie.mp4

ffmpeg -i pie.mp4 -s 480x480 -c:a copy -an pies.mp4

ffmpeg -i vid_pelepasan.mp4 -s 480x480 -c:a copy vids_pelepasan.mp4

ffmpeg -i nakula.mp4 -s 480x270 -c:a copy vid_nakula.mp4

ffmpeg -i dago.mp4 -s 480x270 -c:a copy dago2.mp4

ffmpeg -i diniHaidar07032015.mp4 -s 480x270 -c:a copy diniHaidar07032015s.mp4

ffmpeg -i doliving.mkv -s 1280x720 -c:a copy doliving.mp4


#jokervbatman
ffmpeg -i vokoscreen-2019-12-03_00-03-11.mp4 -s 480x270 -c:a copy vokoscreen-2019-12-03_00-03-11JokerVBatman.mp4
ffmpeg -i vokoscreen-2019-12-03_00-41-53BatmanVJoker.mp4 -s 480x270 -c:a copy vokoscreen-2019-12-03_00-41-53BatmanVJokers.mp4
ffmpeg -i vokoscreen-2019-12-03_02-36-57.mp4 -s 480x270 -c:a copy vokoscreen-2019-12-03_02-36-57s.mp4

ffmpeg -i tutorialKoniSukabumi.mp4 -s 480x270 -c:a copy tutorialKoniSukabumi2.mp4
tutorialKoniSukabumi.mp4

ffmpeg -i vokoscreen-2020-03-27_14-46-07.mp4 -s  480x270 -c:a copy  coronaThisIsTheEnd.mp4


ffmpeg -i lpcd17.mp4 -s  1280x720 -c:a copy lpcd17_720.mp4
ffmpeg -i VID20210602153511_no_sound.mp4 -s  1280x720 -c:a copy VID20210602153511_no_sound_small.mp4

ffmpeg -i banjir.mp4 -s  480x270 -c:a copy banjir2.mp4

ffmpeg -i 45NoSupers_1.mp4 -s  480x270 -c:a copy 45NoSupers_1_small.mp4



ffmpeg -i pain.mkv -s  480x270 -c:a copy pain.mp4

ffmpeg -i king810-killem_all.mp4 -s 852x480 -c:a copy king810-killem_all0.mp4


ffmpeg -i idhand.mkv -s 852x480 -c:a copy -strict -2 idhand.mp4

ffmpeg -i virzarindu.mkv -s 852x480 -c:a copy -strict -2 virzarindu.mp4

ffmpeg -i lovenox.mp4 -s 270x270  -c:a copy -strict -2 lovenoxs.mp4

ffmpeg -i lovenox.mp4 -s 176x352  -c:a copy -strict -2 lovenoxss.mp4

ffmpeg -i jokerwake.mp4 -s 1280x720 -c:a copy -strict -2 jokerwakes.mp4

ffmpeg -i budayawanSunda7EdfYXIxEWc.mkv -s 852x480 -c:a copy -strict -2 budayawanSunda7EdfYXIxEWc.mp4


ffmpeg -i oppa.mp4 -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" outoppa.mp4


ffmpeg -i oppa.mp4 -movflags faststart -s 480x480  -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" outoppa.mp4

ffmpeg -i cepot.mp4 -s  480x270 -c:a copy cepot2.mp4

ffmpeg -i cepot2.mp4 -filter:v scale=270:-1 -c:a copy cepot3.mp4


ffmpeg -i kecoa.webm -filter:v scale=270:-1 -c:a copy -strict -2 kecoa.mp4
ffmpeg -i steal.mp4 -filter:v scale=270:-1 -c:a copy steal2.mp4


ffmpeg -i gunDrumerSlipknot-BMOh6r-erqI.mp4 -ss 00:00:00 -t 00:03:00 -filter:v scale=480:-1 -c:a copy gunDrumerSlipknots-BMOh6r-erqI.mp4

ffmpeg -y -i XVR_ch1_main_20200625120000_20200625130000.dav -vcodec libx264 -crf 24 XVR_ch1_main_20200625120000_20200625130000.mp4

ffmpeg -sseof -60 -y -i XVR_ch1_main_20200625130000_20200625140000.dav -vcodec libx264 -crf 24 XVR_ch1_main_20200625130000_20200625140000.mp4

ffmpeg -sseof -10 -i input.mp4 output.mp4

ffmpeg -sseof -10 -i output.mp4 output2.mp4

ffmpeg -sseof -10 -i XVR_ch1_main_20200625130000_20200625140000.dav -vcodec libx264  -preset ultrafast -qp 0  output.mp4

ffmpeg -sseof -10 -i XVR_ch1_main_20200625130000_20200625140000.dav -vcodec libx264 -crf 24 XVR_ch1_main_20200625130000_20200625140000.mp4

ffmpeg -i output2.mp4 -ss 0 -t 76 output3.mp4

ffmpeg -i badPeople1.mp4 -ss 0 -t 1531 badPeople1s.mp4
ffmpeg -i badPeople1.mp4 -ss 00:25:31 -t 00:30:39 -vcodec libx264 -crf 27 -preset veryfast -c:a copy badPeople1s.mp4

ffmpeg -i badPeople1s.mp4 -ss 0 -t 281 badPeople1scut.mp4

ffmpeg -i badPeople1scut.mp4  -vcodec libx264 -crf 27 -preset veryfast -c:a copy badPeople1sdone.mp4


ffmpeg -ss 00:25:31 -i badPeople1.mp4 -to 00:30:39 -c copy badPeople1sa.mp4



XVR_ch2_main_20200625130000_20200625140000ed.dav

ffmpeg -i XVR_ch2_main_20200625130000_20200625140000ed.dav -vcodec libx264 -crf 27 -preset veryfast -c:a copy XVR_ch2_main_20200625130000_20200625140000.mp4

ffmpeg -i XVR_ch1_main_20200625130000_20200625140000.dav -vcodec libx264 -crf 27 -preset veryfast -c:a copy XVR_ch1_main_20200625130000_20200625140000.mp4

ffmpeg -i output3.mp4 -s  1280x720 -c:a copy output4.mp4

ffmpeg -i 2020-08-05 14-22-28.mkv -s  1280x720 -c:a copy inkai.mp4


#record screen
ffmpeg -f x11grab -y -r 30 -s 1600x900 -i :1 -f alsa -ac 2 -i hw:0 -vcodec libx264  -preset ultrafast -qp 0  springRest.mkv

#mkvToMp3
ffmpeg -i SlipknotALiar_sFuneral_nkYf8ylQk9I.webm -vn -c:a libmp3lame SlipknotALiar_sFuneral_nkYf8ylQk9I.mp3
ffmpeg -i AvengedSevenfoldSoFarAwayDKuySrTxIBs.mkv -vn -c:a libmp3lame AvengedSevenfoldSoFarAwayDKuySrTxIBs.mp3
ffmpeg -i WeMadeItfeatLinkin Park-wmhjzKgS-N8.mkv -vn -c:a libmp3lame WeMadeItfeatLinkin Park-wmhjzKgS-N8.mp3


#wavToMp3
ffmpeg -i 'tanah land voice over-001.wav' tanahLandVo.mp3


ffmpeg -i AvengedSevenfoldSoFarAwayLiveAtTheGRAMMYMuseum®-dw6YHdYk4WA.mkv -vn -c:a libmp3lame AvengedSevenfoldSoFarAwayLiveAtTheGRAMMYMuseum®-dw6YHdYk4WA.mp3

