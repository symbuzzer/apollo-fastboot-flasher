@echo off
set ver=1.0.0
set name=apollo fastboot flasher
set author=Ali BEYAZ
set title=%name% v%ver% - by %author%
title %title%
color 0a
fastboot erase boot || @echo "Erase boot error" && goto exit
fastboot flash crclist images\crclist.txt || @echo "Flash crclist error" && goto exit
fastboot flash xbl_4 images\xbl_4.elf || @echo "Flash xbl_4 error" && goto exit
fastboot flash xbl_config_4 images\xbl_config_4.elf || @echo "Flash xbl_config_4 error" && goto exit
fastboot flash xbl_5 images\xbl_5.elf || @echo "Flash xbl_5 error" && goto exit
fastboot flash xbl_config_5 images\xbl_config_5.elf || @echo "Flash xbl_config_5 error" && goto exit
fastboot flash abl images\abl.elf || @echo "Flash abl error" && goto exit
fastboot flash tz images\tz.mbn || @echo "Flash tz error" && goto exit
fastboot flash hyp images\hyp.mbn || @echo "Flash hyp error" && goto exit
fastboot flash devcfg images\devcfg.mbn || @echo "Flash devcfg error" && goto exit
fastboot flash storsec images\storsec.mbn || @echo "Flash storsec error" && goto exit
fastboot flash bluetooth images\BTFM.bin || @echo "Flash bluetooth error" && goto exit
fastboot flash cmnlib images\cmnlib.mbn || @echo "Flash cmnlib error" && goto exit
fastboot flash cmnlib64 images\cmnlib64.mbn || @echo "Flash cmnlib64 error" && goto exit
fastboot flash modem images\NON-HLOS.bin || @echo "Flash modem error" && goto exit
fastboot flash dsp images\dspso.bin || @echo "Flash dsp error" && goto exit
fastboot flash keymaster images\km4.mbn || @echo "Flash keymaster error" && goto exit
fastboot flash logo images\logo.img || @echo "Flash logo error" && goto exit
fastboot flash featenabler images\featenabler.mbn || @echo "Flash featenabler error" && goto exit
fastboot flash misc images\misc.img || @echo "Flash misc error" && goto exit
fastboot flash aop images\aop.mbn || @echo "Flash aop error" && goto exit
fastboot flash qupfw images\qupv3fw.elf || @echo "Flash qupfw error" && goto exit
fastboot flash uefisecapp images\uefi_sec.mbn || @echo "Flash uefisecapp error" && goto exit
fastboot flash multiimgoem images\multi_image.mbn || @echo "Flash multiimgoem error" && goto exit
fastboot flash super images\super.img || @echo "Flash super error" && goto exit
fastboot flash vbmeta images\vbmeta.img || @echo "Flash vbmeta error" && goto exit
fastboot flash dtbo images\dtbo.img || @echo "Flash dtbo error" && goto exit
fastboot flash vbmeta_system images\vbmeta_system.img || @echo "Flash vbmeta_system error" && goto exit
fastboot flash cache images\cache.img || @echo "Flash cache error" && goto exit
fastboot erase metadata || @echo "Erase metadata error" && goto exit
fastboot flash userdata images\userdata.img || @echo "Flash userdata error" && goto exit
fastboot flash recovery images\recovery.img || @echo "Flash recovery error" && goto exit
fastboot flash cust images\cust.img || @echo "Flash cust error" && goto exit
if exist images\exaid.img (
    fastboot flash exaid images\exaid.img || @echo "Flash exaid error" && goto exit
) else (
    fastboot erase exaid || @echo "Erase exaid error" && goto exit
)
fastboot flash boot images\boot.img || @echo "Flash boot error" && goto exit
fastboot reboot || @echo "Reboot error" && goto exit
:exit
pause
