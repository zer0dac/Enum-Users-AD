#!/bin/bash
echo "This tool is doing your command for 0/24(0-255) ranges for the ip block you gave.

"
read -p "ip block for the users (ex: 192.168.0.0/24):  " ip
read -p "give an outputfile for the usernames: " output

nmap -p 139,389,445 --script smb-enum-users.nse -oN /tmp/nmap-smb-users.txt ${ip}

cat /tmp/nmap-smb-users.txt | grep 'Nmap scan report for' | grep '(' | cut -f '5' -d " " | cut -f '1' -d "." > ${output}