clear

echo "This script will make a bootable USB installer for macOS"
echo
echo "What is the the path of the macOS installer app? (You can drag it into the terminal)"
read -p "macOS Installer path:" appPath
echo
echo "Please enter the volume name of the usb drive you would like to use."
echo "NOTE: This volume will be erased!"
echo
read -p "Volume Name:" volumeLabel

sudo $appPath/Contents/Resources/createinstallmedia --volume
"/Volumes/$volumeLabel" --applicationpath $appPath --nointeraction
