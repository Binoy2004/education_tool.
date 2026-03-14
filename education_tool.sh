#!/bin/bash

# ===============================
# EduRecon - Educational Recon Tool
# Author: Hacking AI (Educational)
# ===============================

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Animation Function
loading() {
echo -ne "${CYAN}Starting EduRecon "
for i in {1..5}; do
    echo -ne "."
    sleep 0.5
done
echo -e "${NC}"
}

# Banner Animation
banner() {
clear
echo -e "${GREEN}"
echo " ███████╗██████╗ ██╗   ██╗██████╗ ███████╗ ██████╗ ██████╗ "
echo " ██╔════╝██╔══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔═══██╗"
echo " █████╗  ██║  ██║██║   ██║██████╔╝█████╗  ██║     ██║   ██║"
echo " ██╔══╝  ██║  ██║██║   ██║██╔══██╗██╔══╝  ██║     ██║   ██║"
echo " ███████╗██████╔╝╚██████╔╝██║  ██║███████╗╚██████╗╚██████╔╝"
echo " ╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ "
echo -e "${NC}"
echo -e "${YELLOW}Educational Recon Tool${NC}"
sleep 1
}

# Spinner Animation
spinner() {
pid=$!
spin='-\|/'
i=0
while kill -0 $pid 2>/dev/null; do
  i=$(( (i+1) %4 ))
  printf "\r${CYAN}Scanning... ${spin:$i:1}${NC}"
  sleep .1
done
printf "\r"
}

# Menu
menu() {
echo -e "${GREEN}Select an option:${NC}"
echo "1) Ping Target"
echo "2) DNS Lookup"
echo "3) WHOIS Info"
echo "4) Exit"
}

# Main Program
banner
loading

read -p "Enter target (domain or IP): " target

while true
do
menu
read -p "Choice: " choice

case $choice in

1)
echo -e "${CYAN}Running Ping Scan...${NC}"
ping -c 4 $target &
spinner
;;

2)
echo -e "${CYAN}Running DNS Lookup...${NC}"
nslookup $target &
spinner
;;

3)
echo -e "${CYAN}Gathering WHOIS Info...${NC}"
whois $target &
spinner
;;

4)
echo -e "${RED}Exiting EduRecon...${NC}"
exit
;;

*)
echo "Invalid option"
;;

esac

done

