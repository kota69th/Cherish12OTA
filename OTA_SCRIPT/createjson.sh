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

# Logo

bold=$(tput bold)
normal=$(tput sgr0)

echo
echo -------------------------------------------------------------------------------------------------------------------------------------
echo    "                                                                                                                                    |  " 
echo -e "\e[35m    IIIIII\  II\   II\ IIIIIIII\ IIIIIII\  IIIIII\  IIIIII\  II\   II\  IIIIII\   IIIIII\         IIIIII\  IIIIIIII\  IIIIII\   \e[0m    |  "
echo -e "\e[35m   II  __II\ II |  II |II  _____|II  __II\ \_II  _|II  __II\ II |  II |II  __II\ II  __II\       II  __II\ \__II  __|II  __II\  \e[0m    |  "
echo -e "\e[35m   II /  \__|II |  II |II |      II |  II |  II |  II /  \__|II |  II |II /  II |II /  \__|      II /  II |   II |   II /  II | \e[0m    |  "
echo -e "\e[35m   II |      IIIIIIII |IIIII\    IIIIIII  |  II |  \IIIIII\  IIIIIIII |II |  II |\IIIIII\        II |  II |   II |   IIIIIIII | \e[0m    |  "
echo -e "\e[35m   II |      II  __II |II  __|   II  __II\   II |   \____II\ II  __II |II |  II | \____II\       II |  II |   II |   II  __II | \e[0m    |  "
echo -e "\e[35m   II |  II\ II |  II |II |      II |  II |  II |  II\   II |II |  II |II |  II |II\   II |      II |  II |   II |   II |  II | \e[0m    |  "
echo -e "\e[35m   \IIIIII  |II |  II |IIIIIIII\ II |  II |IIIIII\ \IIIIII  |II |  II | IIIIII  |\IIIIII  |       IIIIII  |   II |   II |  II | \e[0m    |  "
echo -e "\e[35m    \______/ \__|  \__|\________|\__|  \__|\______| \______/ \__|  \__| \______/  \______/        \______/    \__|   \__|  \__| \e[0m    |  "
echo    "                                                                                                                                    |  "                         
echo -e "   \e[35mCherishOS 3.8 OTA Script.\e[0m                                                                                                        |  "
echo    "                                                                                                                                    |  "
echo -------------------------------------------------------------------------------------------------------------------------------------
echo 
echo Device loaded! Welcome $maintainer.
echo Device Name: $devicename, codenamed \'$device\'.
echo Maintainer Telegram: $telegram
echo Donation Link: $paypal
echo

# Stop the process to continue it.

echo "Press any key to continue OTA's script process."
read -n 1 -r -s -p $"Press CTRL+C if you want to stop the process." 
echo
echo

# Don't modify from there.
script_path="`dirname \"$0\"`"
env_path="./"
zip_name=$env_path/out/target/product/$device/$zip
buildprop=$env_path/out/target/product/$device/system/build.prop

sleep 2
echo ✅ ${bold}Initialized system/build.prop 

if [ -f cherishOTA/DEVICES/$device.json ]; then
  sleep 1
  echo "📚 An old OTA Scheme for this device has been detected and deleted."
  rm cherishOTA/DEVICES/$device.json
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
}' >> cherishOTA/DEVICES/$device.json
echo
echo Done! Push that up and make your PR Request!
echo This build was compiled on `date -d "@$timestamp"`.
echo $device OTA scheme has been created in \"cherishOTA/DEVICES/\" as a JSON file.
