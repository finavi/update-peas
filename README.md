# UpdatePeas - A tool to automatically update the Peas tools for Windows and Linux

![BashDeveloped](https://img.shields.io/badge/developed%20in-bash-informational?style=for-the-badge)

A simple script that gets new releases of linpeas.sh and winPEASx64.exe.

___

### Usage

The script checks for the presence of the two scripts locally, in the directories specified in the variables `linpeas_path` and `winpeas_path`. If already present, they are replaced with the latest release available in the carlospolop/PEASS-ng repository.

Remember to give executable permissions with `chmod +x ./updatePeas.sh`.

```bash
./updatePeas.sh            
[+] Updating LinPEAS.sh and winPEASx64.exe tools . . .

[!] Unable to find linpeas.sh! Downloading the script
[!] Unable to find winPEASx64.exe! Downloading the script
[+] Latest releases downloaded and updated successfully.
```
