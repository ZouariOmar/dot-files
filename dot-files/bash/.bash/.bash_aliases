#!/usr/bin/env bash
# ==================================================================================
# .FILE
#   .bash_aliases
#
# .SYNOPSIS
#   Shell customization script for defining command aliases.
#
# .DESCRIPTION
#   This script is sourced during the initialization of an interactive shell session.
#   It defines shortcuts and command aliases for git, navigation, system management,
#   package management (Arch/Arch-based), networking, editors, and programming languages.
#   The purpose is to speed up repetitive tasks and improve the shell experience.
#
# .PARAMETER N/A
#   This file does not accept parameters; it is sourced automatically by the shell.
#
# .INPUTS
#   None
#
# .OUTPUTS
#   Bash aliases available in the interactive shell session.
#
# .NOTES
#   Version       : 1.0
#   Author        : @ZouariOmar (zouariomar20@gmail.com)
#   Created       : 2026-07-16
#   Changelog     : 316022d
#
# .EXAMPLE
#   $ lgit      # opens lazygit
#   $ ..        # go up one directory
#   $ pacu      # update Arch system
# ==================================================================================

# Git
alias lg='lazygit' # Open `lazygit`
# alias ga='git add'             # Add files to staging
# alias gaa='git add --all'      # Add all files to Git
# alias gc='git commit'          # Commit changes
# alias gca='git commit --amend' # Amend the last commit
# alias gc='git checkout'        # Checkout a branch or file
# alias gcb='git checkout -b'    # Create a new Git branch and move to the new branch at the same time
# alias gl='git log --oneline'   # Show the log as a single line
# alias gs='git status'          # Check the status of your git repo
# alias gd='git diff'            # View the difference
# alias gdc='git diff --cached'  # View the cached difference

# Docker
alias ldocker='lazydocker' # Open lazydocker
# alias dps="docker ps"          # List running containers
# alias dimages="docker images"  # List Docker images
# alias dbuild="docker build -t" # Build a Docker image
# alias dstop="docker stop"      # Stop a running container

# Navigation
alias ls='lsd'            # Use 'lsd' for a modern and colorful 'ls' alternative
alias la='ls -a'          # List all files including hidden ones
alias lla='ls -la'        # List all files including hidden ones with detailed information
alias lt='ls --tree'      # Display directory structure as a tree
alias l='ls -lh'          # List files with human-readable sizes using 'lsd'
alias ll='ls -la'         # List files with details (long format)
alias ..='cd ..;pwd'      # Go up one directory
alias ...='cd ../..;pwd'  # Go up two directories
alias ~='cd ~;pwd'        # Go to home directory
alias fonts='fc-list'     # List all availble fonts
alias nnn='nnn -Ui'       # n³ with more details
alias ofe='xdg-open .'    # Open File Explorer in current directory
alias grep='grep --color' # Grep with color

# System Management
alias wmi='whoami'                                                              # Display the current username
alias c='clear'                                                                 # Clear the terminal screen
alias h='history'                                                               # Show command history
alias mkd='mkdir -pv'                                                           # Make a directory and all parent directories with verbosity and go into it
alias df='df -h'                                                                # Show disk usage with human-readable units
alias top='htop'                                                                # Use htop for a more interactive process monitor
alias hostname='cat /etc/hostname'                                              # Show the hostname
alias cc="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'"                       # Drops all pagecache, dentries, and inodes from the RAM
alias kp='keepassxc-cli'                                                        # Shortcut for `keepassxc-cli`
alias xc='xclip -selection clipboard'                                           # Copy the content into the clipboard (ensures it goes to the standard Ctrl+C/Ctrl+V clipboard)
alias neo='neofetch --config /home/zouari_omar/.config/neofetch/acenoster.conf' # Custom Alias for neofetch

# Arch / AUR Package Management
alias pacu='sudo pacman -Syu'  # Updating package database and upgrading system
alias pacc='sudo pacman -Sc'   # Clearing unused pacman cache
alias pacls='pacman -Qs'       # List all installed pacman packages
alias paci='sudo pacman -S'    # Install pacman package
alias pacrm='sudo pacman -Rns' # Remove a specific pacman package
alias yayu='yay -Syu'          # Update all installed packages using yay
alias yayc='yay -Sc'           # Clean up unnecessary package files using yay
alias yayls='yay -Qs'          # List all installed AUR packages
alias yayi='yay -S'            # Install AUR package
alias yayrm='sudo yay -Rns'    # Remove a specific yay package

# Network
alias pubip='curl -s ifconfig.me' # Get Public IP Address
# alias shark='sudo tshark --color' # WireShark CLI with colors | Add -l for line-buffered (live monitoring mode)

# Editor
alias v='vim'
alias nv='nvim'

# Programming
# alias jlab='jupyter-lab'
