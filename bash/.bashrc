# Set bash header theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/$POSH_THEME.omp.json)"

# Load custom colors
if [ -f ~/.bash_colors ]; then
  source ~/.bash_colors
fi

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
alias nnn="nnn -Ui"      # n³ with more details

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
alias pacu="sudo pacman -Syu"                                     # Updating package database and upgrading system
alias pacc="sudo pacman -Sc"                                      # Clearing unused pacman cache
alias paccc="sudo pacman -Rns $(pacman -Qtdq)"                    # Remove unused pacman packages
alias pacls="pacman -Qs"                                          # List All Installed pacman Packages
alias pacrm="sudo pacman -Rns"                                    # Remove a specific pacman package
alias yayu="yay -Syu"                                             # Update all installed packages using yay
alias yayc="yay -Sc"                                              # Clean up unnecessary package files using yay
alias yaycc="yay -Rns $(yay -Qtdq)"                               # Remove unused yay packages
alias yayls="yay -Qs"                                             # List All Installed AUR Packages
alias yayrm="sudo yay -Rns"                                       # Remove a specific yay package
alias wmi="whoami"                                                # Display the current username
alias c="clear"                                                   # Clear the terminal screen
alias h="history"                                                 # Show command history
alias mkd="mkdir -pv"                                             # Make a directory and all parent directories with verbosity and go into it
alias df="df -h"                                                  # Show disk usage with human-readable units
alias top="htop"                                                  # Use htop for a more interactive process monitor
alias hostname="cat /etc/hostname"                                # Show the hostname
alias wordlists='ll /usr/share/wordlists'                         # Show your wordlists sets
alias clear_cache="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches" # Drops all pagecache, dentries, and inodes from the RAM

# Network Aliases
alias prvip="ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1" # Get Private IP Address
alias pubip="curl -s ifconfig.me"                                               # Get Public IP Address
alias shark='sudo tshark --color'                                               # WireShark CLI with colors | Add -l for line-buffered (live monitoring mode)

# Docker Aliases
alias dps="docker ps"          # List running containers
alias dimages="docker images"  # List Docker images
alias dbuild="docker build -t" # Build a Docker image
alias dstop="docker stop"      # Stop a running container

# Vim/Nvim Aliases
alias v='vim'
alias nv='nvim'

# C/C++ Aliases
alias g++='g++ -std=c++23 -Wall -Wextra -Wpedantic -O2'
alias gcc='gcc -std=c17 -Wall -Wextra -Wpedantic -O2'

# Python Aliases
alias jlab='jupyter-lab'

# Show latest `$1` Arch Linux news before upgrading
pacnews() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: pacnews <latest_news_number>"
    return 1
  fi

  echo "🔔 Latest Arch Linux news:"
  curl -s https://archlinux.org/news/ |
    grep -Eo 'href="/news/[^"]+"' |
    cut -d'"' -f2 |
    head -n "$1" |
    sed 's|^|https://archlinux.org|'

  echo -e ".\n.\n.\n."
  read -p "Do you want to continue with the system upgrade? [y/N] " answer
  if [[ "$answer" =~ ^[yY]$ ]]; then
    sudo pacman -Syu
  else
    echo "⏹️ Upgrade cancelled."
  fi
}

# Launch `nnn` as `n` and change to the last visited directory on exit
n() {
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE"
  fi
}

# Check if the bash-completion script exists at /usr/share/bash-completion/bash_completion.
# If it does, source the script to enable bash completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Set PIO
export PLATFORMIO_HOME="$HOME/.local/bin"
export PATH=$PATH:$PLATFORMIO_HOME

# Set JAVA
export JAVA_HOME=/usr/lib/jvm/java-24-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Set MAVEN
export M2_HOME="$HOME/.m2/"

# Set SDKMAN
export PATH="$HOME/.sdkman/candidates/java/current/bin:$PATH"

# Set Android SDK (last)
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Set EDITOR
export EDITOR="nv"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


