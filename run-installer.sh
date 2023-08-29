#!/bin/bash
echo "Installing Protontricks"
flatpak --system install com.github.Matoking.protontricks -y
flatpak override --user --filesystem=/run/media/mmcblk0p1 com.github.Matoking.protontricks
echo

echo "Downloading & Installing .NET Desktop 6.0 Runtimes"
flatpak run com.github.Matoking.protontricks 377840 dotnetdesktop6 &> /dev/null
echo

echo "Downloading Echo-S 9 Installer"
curl -sSL -o "EchoS9.tmp.exe" "https://download.tsunamods.com/?id=7"

echo "Launching Echo-S 9 Installer"
STEAM_COMPAT_CLIENT_INSTALL_PATH="${HOME}/.local/share/Steam/" \
STEAM_COMPAT_DATA_PATH="${HOME}/.local/share/Steam/steamapps/compatdata/377840/" \
${HOME}/.local/share/Steam/steamapps/common/Proton\ 8.0/proton run EchoS9.tmp.exe &> /dev/null
rm EchoS9.tmp.exe
echo

echo "Forcing Final Fantasy IX to run under Proton Experimental"
kill $(ps aux | grep '[s]team -steamdeck' | awk '{print $2}')
sleep 10
cp ${HOME}/.local/share/Steam/config/config.vdf ${HOME}/.local/share/Steam/config/config.vdf.bak
perl -0777 -i -pe 's/"CompatToolMapping"\n\s+{/"CompatToolMapping"\n\t\t\t\t{\n\t\t\t\t\t"377840"\n\t\t\t\t\t{\n\t\t\t\t\t\t"name"\t\t"proton_experimental"\n\t\t\t\t\t\t"config"\t\t""\n\t\t\t\t\t\t"priority"\t\t"250"\n\t\t\t\t\t}/gs' \
${HOME}/.local/share/Steam/config/config.vdf
# Thanks ChatGPT
nohup steam &> /dev/null &
echo

echo "Done! Launch Final Fantasy IX to select mods."
echo "Press enter to exit."
read
kill -9 $PPID