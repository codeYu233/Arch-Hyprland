#!/bin/bash
# fcitx5 for chinese input #

fcitx=(
    fcitx5
    fcitx5-configtool
    fcitx5-gtk
    fcitx5-qt
    fcitx5-rime
    fcitx5-chinese-addons
)

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



# Set the name of the log file to include the current date and time
LOG="Install-Logs/install-$(date +%d-%H%M%S)_fcitx5.log"

### Install software for fcitx5-chinese ###

printf " Installing ${SKY_BLUE}fcitx5-chinese packages${RESET}...\n"
for f in "${fcitx[@]}"; do
install_package  "$f" "$LOG"
echo "$f has been installed!"
done

printf "\n%.0s" {1..2}