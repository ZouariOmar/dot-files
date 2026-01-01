#!/bin/bash
# Author: @ZouariOmar

# Install the neofetch backup
if mv neofetch ~/.config -iv; then
  echo -e "\033[32m[SUCCESS]\033[0m Moved neofetch to ~/.config"
else
  echo -e "\033[31m[ERROR]\033[0m Can't Move neofetch conf files!"
  exit 1
fi
