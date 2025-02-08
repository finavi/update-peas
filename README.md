# UpdatePeas - A tool to automatically update the Peas scripts for Windows and Linux

![BashDeveloped](https://img.shields.io/badge/developed%20in-bash-informational?style=for-the-badge)

A simple script that gets new releases of linpeas.sh and winPEASx64.exe.

___

### Usage

This script downloads and updates the latest versions of LinPEAS and WinPEAS from the specified GitHub repository. Users can specify custom download paths as arguments or use the default paths. It verifies existing files, removes outdated versions, and fetches the latest releases.

Remember to give executable permissions with `chmod +x ./updatePeas.sh`.

```bash
$ ./updatePeas.sh                                                 

Usage: ./updatePeas.sh [LINPEAS_PATH] [WINPEAS_PATH]

Current repository is 'peass-ng/PEASS-ng'. Do you want to change it? (Y/y): N

[+] Updating LinPEAS.sh and winPEASx64.exe tools . . .

[!] Unable to find linpeas.sh! Downloading the script.
[!] Unable to find winPEASx64.exe! Downloading the script.

[+] Latest releases downloaded and updated successfully.

[+] LinPEAS saved in: /home/kali/Tools/Linux
[+] WinPEAS saved in: /home/kali/Tools/Windows
```
