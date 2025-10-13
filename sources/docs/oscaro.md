Flashing Guide for OnePlus Nord CE2 Lite 5G

#Clean Flash
Download flash-rom.zip from Rom post
Extract flash-rom.zip and flash using commands below
Flash in fastboot 
fastboot wipe-super super_empty.img
fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
fastboot flash vbmeta vbmeta.img
Flash Recovery
fastboot flash vendor_boot vendor_boot.img
fastboot reboot recovery
Flash Rom
Apply/Install Update > Apply from ADB 
adb sideload <path_to_file.zip>
Format Data 
Reboot


#Dirty Flash
Reboot to recovery 
Apply/Install Update > Apply from ADB 
adb sideload <path_to_file.zip>
Reboot
