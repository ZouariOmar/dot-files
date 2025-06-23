# Set bash header theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/$POSH_THEME.omp.json)"

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Custom Alias for neofetch
alias neof='neofetch --config /home/zouari_omar/.config/neofetch/acenoster.conf'

# Custom Aliases for Navigation
alias ls="lsd"           # Use 'lsd' for a modern and colorful 'ls' alternative
alias la="ls -a"         # List all files including hidden ones
alias lla="ls -la"       # List all files including hidden ones with detailed information
alias lt="ls --tree"     # Display directory structure as a tree
alias l="ls -lh"         # List files with human-readable sizes using 'lsd'
alias ll="ls -la"        # List files with details (long format)
alias ..="cd ..;pwd"     # Go up one directory
alias ...="cd ../..;pwd" # Go up two directories
alias ~="cd ~;pwd"       # Go to home directory
alias fonts="fc-list"    # List all availble fonts
alias nnn="nnn -dUi"     # n³ with more details

# Git Aliases
alias ga='git add'             # Add files to staging
alias gaa='git add --all'      # Add all files to Git
alias gc='git commit'          # Commit changes
alias gca='git commit --amend' # Amend the last commit
alias gc='git checkout'        # Checkout a branch or file
alias gcb='git checkout -b'    # Create a new Git branch and move to the new branch at the same time
alias gl='git log --oneline'   # Show the log as a single line
alias gs='git status'          # Check the status of your git repo
alias gd='git diff'            # View the difference
alias lg='lazygit'             # Open `lazygit`

# System Management Aliases
alias pacmanu="sudo pacman -Syu"                # Updating package database and upgrading system
alias pacmanc="sudo pacman -Sc"                 # Clearing unused package cache
alias pacmanls="pacman -Q"                      # List All Installed pacman Packages
alias pacmanrm="sudo pacman -R $(pacman -Qtdq)" # Remove unused pacman packages
alias yayu="yay -Syu"                           # Update all installed packages using yay
alias yayc="yay -Sc"                            # Clean up unnecessary package files using yay
alias yayls="yay -Qdt"                          # List All Installed AUR Packages
alias yayrm="yay -R $(yay -Qtdq)"               # Remove unused yay packages
alias wmi="whoami"                              # Display the current username
alias c="clear"                                 # Clear the terminal screen
alias h="history"                               # Show command history
alias mkd="mkdir -p -v"                         # Make a directory and all parent directories with verbosity and go into it
alias df="df -h"                                # Show disk usage with human-readable units
alias top="htop"                                # Use htop for a more interactive process monitor

# Network Aliases
alias PRIVATE_IP="ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1" # Get Private IP Address
alias PUBLIC_IP="curl -s ifconfig.me"                                                # Get Public IP Address

# Docker Aliases
alias dps="docker ps"          # List running containers
alias dimages="docker images"  # List Docker images
alias dbuild="docker build -t" # Build a Docker image
alias dstop="docker stop"      # Stop a running container

# Platformio - export `$HOME/.local/bin/` directory to the PATH environmental variable
export PATH=$PATH:$HOME/.local/bin

# Check if the bash-completion script exists at /usr/share/bash-completion/bash_completion.
# If it does, source the script to enable bash completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# The `spkg` function searches for an installed package in the system using `pacman`.
# It takes exactly one argument:
#   1. <package_name>: The name of the package to search for in the installed packages.
#
# Usage:
#   spkg <package_name>
# Example:
#   spkg vim
#
# If the function is called without exactly one argument, it displays an error message
# and exits with a return code of 1.
#
# Arguments:
#   "$1" - The package name to search for.
# Returns:
#   1 - If the number of arguments is not exactly 1.
#   0 - If the package search is successfully executed.
spkg() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: search_pkg <package_name>"
    return 1
  fi
  pacman -Qs "$1"
}

# The `rmpkg` function removes a specified package from the system using `pacman`.
# It also removes any dependencies that were installed with the package and are no longer required.
# The function takes exactly one argument:
#   1. <package_name>: The name of the package to remove.
#
# Usage:
#   rmpkg <package_name>
# Example:
#   rmpkg vim
#
# If the function is called without exactly one argument, it displays an error message
# and exits with a return code of 1.
#
# Arguments:
#   "$1" - The name of the package to remove.
# Returns:
#   1 - If the number of arguments is not exactly 1.
#   0 - If the package removal is successfully executed.
rmpkg() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: remove_pkg <package_name>"
    return 1
  fi
  sudo pacman -Rns "$1"
}

# Launch nnn and change to the last visited directory on exit
n() {
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE"
  fi
}
