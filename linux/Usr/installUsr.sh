#!/bin/bash
# Author: @ZouariOmar

# Conserve the current local usr pkg
if mv /usr/local /usr/local.old -iv; then
  echo -e "\033[32m[SUCCESS]\033[0m Moved /usr/local to /usr/local.old"
else
  echo -e "\033[31m[ERROR]\033[0m Can't Move /usr/local to /usr/local.old"
  exit 1
fi

# Install the local usr backup
if mv usr/local /usr -iv; then
  echo -e "\033[32m[SUCCESS]\033[0m Moved usr/local to /usr"
else
  echo -e "\033[31m[ERROR]\033[0m Can't Move usr/local to /usr"
  exit 1
fi
