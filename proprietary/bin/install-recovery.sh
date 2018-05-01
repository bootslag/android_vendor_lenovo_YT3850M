#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:15938860:97587087a7dda80c3aa9426f929c25a7b87dc9e6; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:15377704:3fd968f6e0e040273062cac5039890c5c8ae75fb EMMC:/dev/block/bootdevice/by-name/recovery 97587087a7dda80c3aa9426f929c25a7b87dc9e6 15938860 3fd968f6e0e040273062cac5039890c5c8ae75fb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
