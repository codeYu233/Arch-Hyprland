#!/bin/bash
# Hyprland-Dots to download from main #


## WARNING: DO NOT EDIT BEYOND THIS LINE IF YOU DON'T KNOW WHAT YOU ARE DOING! ##
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Change the working directory to the parent directory of the script
PARENT_DIR="$SCRIPT_DIR/.."
cd "$PARENT_DIR" || { echo "${ERROR} Failed to change directory to $PARENT_DIR"; exit 1; }

# Source the global functions script
if ! source "$(dirname "$(readlink -f "$0")")/Global_functions.sh"; then
  echo "Failed to source Global_functions.sh"
  exit 1
fi

# Check if Hyprland-Dots exists
printf "${NOTE} Cloning and Installing ${SKY_BLUE}codeyu233's Hyprland Dots${RESET}....\n"

if [ -d Hyprland-Dots ]; then
  cd Arch-dotfiles
  git stash && git pull
  chmod +x copy.sh
  ./copy.sh 
else
  if git clone --depth=1 https://github.com/codeyu233/Arch-dotfiles.git; then
    cd Arch-dotfiles || exit 1
    chmod +x copy.sh
    ./copy.sh 
  else
    echo -e "$ERROR Can't download ${YELLOW}codeyu233's Hyprland-Dots${RESET} . Check your internet connection"
  fi
fi

printf "\n%.0s" {1..2}