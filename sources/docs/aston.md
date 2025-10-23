===== Instructions =====


Prerequisites:
 • Your device must be running OxygenOS(12R)/ColorOS(ACE3) version 15.0.0.600 or higher.
 • Flash the current OxygenOS/ColorOS version again using local install to ensure
   both slots have the same firmware. (Failing to do so will get you bricked)


Clean flash:
1, Reboot to bootloader
2. Flash recovery
       $ fastboot flash recovery recovery.img
3. Reboot to recovery
4. Put the recovery in sideload mode and push the ROM zip
       $ adb sideload rom.zip
5. Format data/Factory reset
6. Reboot to system

If sideloading the rom gives you error 7:
 • Reboot to recovery
 • Enter fastbootd
       $ fastboot wipe-super super_empty.img
 • Enter recovery
 • Sideload the rom zip
 • Format data
 • Reboot

If after sideloading the rom, the device boots to bootloader:
 • Do clean flash steps again
 • When it asks for Yes/No prompt for installing additional packages, select Yes
 • After device reboots recovery, sideload again.
 • This time when it asks for Yes/No prompt for installing additional packages, select No
 • Format and Reboot