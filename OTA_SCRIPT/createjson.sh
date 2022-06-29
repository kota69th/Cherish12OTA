#!/bin/bash
#put script in CherishOS source folder, make executable (chmod +x createupdate.sh) and run it (./createupdate.sh)

#modify values below
#leave blank if not used
maintainer="Maintainer Name" #ex: Lup Gabriel (gwolfu)
oem="OEM" #ex: OnePlus
device="Device codename" #Device Codename, ex: guacamole
devicename="Device Name" #ex: OnePlus 7 Pro
zip="Cherish-ROM-NAME.zip" #The ROM file name.
buildtype="Cherish OS V3.8 Official" #ROM State
forum="https://forum.xda-developers.com/" #XDA Link
gapps="" #https link (leave blank if unused)
firmware="" #https link (leave blank if unused)
modem="" #https link (leave blank if unused)
bootloader="" #https link (leave blank if unused)
recovery="" #https link (leave blank if unused)
paypal="https://paypal.me/hungphan2001" #https link (leave blank if unused)
telegram="" #https link (leave blank if unused)
dt="" #https link (leave blank if unused)
commondt="" #https link (leave blank if unused)
kernel="" #https link (leave blank if unused)

echo CherishOS OTA Script, for 3.8 version.
echo Loading OTA Script using $device configuration...

#don't modify from here
script_path="`dirname \"$0\"`"
env_path="./"
zip_name=$env_path/out/target/product/$device/$zip
buildprop=$env_path/out/target/product/$device/system/build.prop

if [ -f $script_path/$device.json ]; then
  rm $script_path/$device.json
fi

linenr=`grep -n "ro.system.build.date.utc" $buildprop | cut -d':' -f1`
timestamp=`sed -n $linenr'p' < $buildprop | cut -d'=' -f2`
zip_only=`basename "$zip_name"`
md5=`md5sum "$zip_name" | cut -d' ' -f1`
sha256=`sha256sum "$zip_name" | cut -d' ' -f1`
size=`stat -c "%s" "$zip_name"`
version=`echo "$zip_only" | cut -d'-' -f5`
version=`echo 3.8`

echo '{
  "response": [
    {
        "maintainer": "'$maintainer'",
        "oem": "'$oem'",
        "device": "'$devicename'",
        "filename": "'$zip_only'",
        "download": "https://sourceforge.net/projects/cherish-os/files/device/'$device'/'$zip_only'/download",
        "timestamp": '$timestamp',
        "md5": "'$md5'",
        "sha256": "'$sha256'",
        "size": '$size',
        "version": "'$version'",
        "buildtype": "'$buildtype'",
        "forum": "'$forum'",
        "gapps": "'$gapps'",
        "firmware": "'$firmware'",
        "modem": "'$modem'",
        "bootloader": "'$bootloader'",
        "recovery": "'$recovery'",
        "paypal": "'$paypal'",
        "telegram": "'$telegram'",
        "dt": "'$dt'",
        "common-dt": "'$commondt'",
        "kernel": "'$kernel'"
    }
  ]
}' >> cherishOTA/$device.json
echo $device OTA scheme has been created in \"cherishOTA/\" as a JSON file.
