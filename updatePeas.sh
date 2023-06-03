#!/bin/bash

# Variables

echo "[+] Updating LinPEAS.sh and winPEASx64.exe tools . . ."
echo ""

repo="carlospolop/PEASS-ng"  # Replace with the GitHub repository in the format "owner/repo"
linpeas_path="/home/kali/tools"  # Replace with the path to 'linpeas.sh' script
winpeas_path="/home/kali/tools/WinTools"  # Replace with the path to the 'winPEASx64.exe' executable

# File Checks
if [ -f "$linpeas_path/linpeas.sh" ]; then
    echo "[+] Found linpeas.sh! Updating the script"
    rm $linpeas_path/linpeas.sh
else
    echo "[!] Unable to find linpeas.sh! Downloading the script"
fi

if [ -f "$winpeas_path/winPEASx64.exe" ]; then
    echo "[+] Found winPEASx64.exe! Updating the script"
    rm $winpeas_path/winPEASx64.exe
else
    echo "[!] Unable to find winPEASx64.exe! Downloading the script"
fi

download_url_linpeas=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -oP '"browser_download_url": "\K(.*)(?=")' | grep linpeas.sh )
download_url_winpeas=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -oP '"browser_download_url": "\K(.*)(?=")' | grep winPEASx64.exe )

# Download the latest releases
wget -O "$linpeas_path/linpeas.sh" "$download_url_linpeas" -q
wget -O "$winpeas_path/winPEASx64.exe" "$download_url_winpeas" -q

echo ""
echo "[+] Latest releases downloaded and updated successfully."