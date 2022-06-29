# Cherish12OTA

A CherishOS 12L OTA Updater Script based on crDroid's Script.
By kota.

### 1. JSON structure ###

Information : Timestamp is taken from the build's system/build.prop file.

```
{
  "response": [
    {
        "maintainer": "Name (nickname)",
        "oem": "OEM",
        "device": "Device Name",
        "filename": "Cherish-OS-v<Cherish Version>-<Build Name>-<Build Number>-<Device Codename>-OFFICIAL(-GApps.zip [OPTIONAL]).zip",
        "download": "https://sourceforge.net/projects/cherish-os/files/device/'$device'/$filename/download",
        "timestamp": <TIMESTAMP>,
        "md5": "abcdefg123456",
        "sha256": "abcdefg123456",
        "size": 123456789,
        "version": "<Cherish Version>",
        "buildtype": "Cherish <Cherish Version> Official",
        "forum": "https://forum link",
        "gapps": "https://gapps link",
        "firmware": "https://firmware link",
        "modem": "https://modem link",
        "bootloader": "https://bootloader link",
        "recovery": "https://recovery link",
        "paypal": "https://donation link",
        "telegram": "https://telegram link",
        "dt": "https://devicetree link",
        "common-dt": "https://commondt link",
        "kernel": "https://kernel link"
    }
  ]
}
```
  
1. Clone this repo locally in your ROM Folder (not out/ directory)
```
git clone https://github.com/kota69th/Cherish12OTA -b 12L cherishOTA/
```

### 2. Build's Changelog ### 

Making the Build's changelog. 
Make a file named changelog_<Device Codename> and make a changelog the way you like.
Once done, move it to `cherishOTA/CHANGELOGS` if it not already done.
  
2. On your ROM Folder, go to `cherishOTA/OTA_SCRIPT/` and edit createjson.sh to match your case.
  
  Example:

```
maintainer="kota" #ex: kota
oem="Xiaomi" #ex: OnePlus
device="venus" #ex: guacamole
devicename="Xiaomi Mi 11" #ex: OnePlus 7 Pro
zip="Cherish-OS-v3.8-20220627-1429-venus-OFFICIAL-GApps.zip" #The ROM file name.
buildtype="Cherish OS V3.8 Official" #ROM State
forum="https://forum.xda-developers.com/t/rom-12-1-venus-_-cherish-os-v3-8-for-xiaomi-mi-11_official.4459637/" #XDA Link
gapps="" #https link (leave blank if unused)
firmware="" #https link (leave blank if unused)
modem="" #https link (leave blank if unused)
bootloader="" #https link (leave blank if unused)
recovery="" #https link (leave blank if unused)
paypal="https://paypal.me/hungphan2001" #https link (leave blank if unused)
telegram="https://t.me/kota15th" #https link (leave blank if unused)
dt="" #https link (leave blank if unused)
commondt="" #https link (leave blank if unused)
kernel="" #https link (leave blank if unused)
```
  
3. Open a terminal in your ROM folder and run the script by performing this command :
  
```bash cherishOTA/OTA_SCRIPT/createjson.sh```
  
NOTE : 
This scripts need a modified CherishOS Updater to work with. (for now)
None mandatory informations for the Script are precised! 
