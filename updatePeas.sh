#!/bin/bash

# Splash Screen with Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'
YELLOW='\033[0;33m'

echo -e ""
echo -e "${CYAN} _   _           _       _      ______              ${RESET}"
echo -e "${CYAN}| | | |         | |     | |     | ___ \             ${RESET}"
echo -e "${CYAN}| | | |_ __   __| | __ _| |_ ___| |_/ /__  __ _ ___ ${RESET}"
echo -e "${CYAN}| | | | '_ \ / _\` |/ _\` | __/ _ \  __/ _ \/ _\` / __|${RESET}"
echo -e "${CYAN}| |_| | |_) | (_| | (_| | ||  __/ | |  __/ (_| \__ \ ${RESET}"
echo -e "${CYAN} \___/| .__/ \__,_|\__,_|\__\___\_|  \___|\__,_|___/${RESET}"
echo -e "${CYAN}      | |                                           ${RESET}"
echo -e "${CYAN}      |_|                                           ${RESET}"
echo -e ""
echo -e "${CYAN}Usage: ./updatePeas.sh [LINPEAS_PATH] [WINPEAS_PATH]${RESET}"
# Ask user to confirm or modify the GitHub repository
echo -ne "${YELLOW}Current repository is 'peass-ng/PEASS-ng'. Do you want to change it? (Y/y): ${RESET}" 
read change_repo
if [[ "$change_repo" =~ ^[Yy]$ ]]; then
    echo -ne "Enter the new repository (format: owner/repo): " 
read repo
else
    repo="peass-ng/PEASS-ng"
fi

# Default paths
default_linpeas_path="/home/kali/Tools/Linux"
default_winpeas_path="/home/kali/Tools/Windows"

# Check if arguments are provided
linpeas_path=${1:-$default_linpeas_path}
winpeas_path=${2:-$default_winpeas_path}

# Start updating process
echo -e "${GREEN}[+] Updating LinPEAS.sh and winPEASx64.exe tools . . .${RESET}"
echo ""

# File Checks
if [ -f "$linpeas_path/linpeas.sh" ]; then
    echo -e "${GREEN}[+] Found linpeas.sh! Updating the script.${RESET}"
    rm "$linpeas_path/linpeas.sh"
else
    echo -e "${RED}[!] Unable to find linpeas.sh! Downloading the script.${RESET}"
fi

if [ -f "$winpeas_path/winPEASx64.exe" ]; then
    echo -e "${GREEN}[+] Found winPEASx64.exe! Updating the script.${RESET}"
    rm "$winpeas_path/winPEASx64.exe"
else
    echo -e "${RED}[!] Unable to find winPEASx64.exe! Downloading the script.${RESET}"
fi

# Fetch latest release download URLs
download_url_linpeas=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -oP '"browser_download_url": "\K(.*)(?=")' | grep linpeas.sh )
download_url_winpeas=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -oP '"browser_download_url": "\K(.*)(?=")' | grep winPEASx64.exe )

# Check if URLs were retrieved
if [ -z "$download_url_linpeas" ] || [ -z "$download_url_winpeas" ]; then
    echo -e "${RED}[!] Failed to retrieve download URLs. Check the repository name or network connection.${RESET}"
    exit 1
fi

# Download the latest releases
wget -O "$linpeas_path/linpeas.sh" "$download_url_linpeas" -q
wget -O "$winpeas_path/winPEASx64.exe" "$download_url_winpeas" -q

echo ""
echo -e "${GREEN}[+] Latest releases downloaded and updated successfully.${RESET}"
echo ""
echo -e "${BLUE}[+] LinPEAS saved in: ${linpeas_path}${RESET}"
echo -e "${BLUE}[+] WinPEAS saved in: ${winpeas_path}${RESET}"