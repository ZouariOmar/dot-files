#!/bin/bash
# Author: @ZouariOmar

# Targed bash files
files=(".bash_profile" ".bashrc")

# Conserve the current local usr pkg
for i in "${!files[@]}"; do
  src="${HOME}/${files[$i]}"
  dest="${src}.old"

  if mv "$src" "$dest"; then
    echo -e "\033[32m[SUCCESS]\033[0m Moved '$src' to '$dest'"
  else
    echo -e "\033[31m[ERROR]\033[0m Can't move '$src' to '$dest'"
    exit 1
  fi
done

# Install the bash backup
for i in "${!files[@]}"; do
  src="${files[$i]}"
  dest="${HOME}/${src}"

  if mv "$src" "$dest"; then
    echo -e "\033[32m[SUCCESS]\033[0m Moved '$src' to '$dest'"
  else
    echo -e "\033[31m[ERROR]\033[0m Can't move '$src' to '$dest'"
    exit 1
  fi
done
