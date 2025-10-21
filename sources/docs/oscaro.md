# Flashing steps for Oneplus Nord CE2 Lite(oscaro)

**Before start flashing.....**
- Backup all your Data (If doing clean flash)
- Download flash_rom.zip from SF

## Clean Flash 
   **Download & Extract flash_matrixx.zip from website**
   **Flash in fastboot mode**

```
fastboot wipe-super super_empty.img
fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
fastboot flash vbmeta vbmeta.img
fastboot flash vendor_boot vendor_boot.img
```

**Reboot to recovery**
```
fastboot reboot recovery
```

**Flash rom**
 
Apply/Install Update > Apply from ADB

```
adb sideload <path_to_file.>.zip
```
Format Data

Reboot to recovery and flash gapps package(if needed)

**Format data and reboot to system** 


## Dirty Flash
Reboot to recovery 

Apply/Install Update > Apply from ADB 

**adb sideload**
```
adb sideload <path_to_file>.zip
```
Reboot to system




