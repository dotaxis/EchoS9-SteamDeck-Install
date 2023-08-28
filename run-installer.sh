#!/bin/bash
echo "Downloading & Installing .NET Desktop 6.0 Runtimes"
flatpak run com.github.Matoking.protontricks 377840 dotnetdesktop6 &> /dev/null

echo "Downloading Echo-S 9 Installer"
curl -sSL -o "EchoS9.tmp.exe" "https://download.tsunamods.com/?id=7"

echo "Launching Echo-S 9 Installer"
STEAM_COMPAT_CLIENT_INSTALL_PATH="${HOME}/.local/share/Steam/" \
STEAM_COMPAT_DATA_PATH="${HOME}/.local/share/Steam/steamapps/compatdata/377840/" \
${HOME}/.local/share/Steam/steamapps/common/Proton\ 8.0/proton run EchoS9.tmp.exe &> /dev/null
rm EchoS9.tmp.exe

echo "Done! Launch Final Fantasy IX to select mods."
