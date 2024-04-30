#!/bin/bash
shopt -s expand_aliases
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'

echo "Installing Protontricks"
flatpak --system install com.github.Matoking.protontricks -y
flatpak override --user --filesystem=/run/media/mmcblk0p1 com.github.Matoking.protontricks
echo

echo "Downloading & Installing .NET Desktop 6.0 Runtimes"
protontricks 377840 dotnetdesktop6 &> /dev/null
echo

echo "Downloading Echo-S 9 Installer"
curl -#SL -o "EchoS9.tmp.exe" "https://download.tsunamods.com/?id=7"
echo

echo "Launching Echo-S 9 Installer"
protontricks-launch --appid 377840 EchoS9.tmp.exe &> /dev/null
rm EchoS9.tmp.exe
echo

echo "Done! Launch Final Fantasy IX to select mods."
echo "Press enter to exit."
read
kill -9 $PPID
