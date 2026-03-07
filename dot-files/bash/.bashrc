# ==================================================================================
# .FILE
#   .bashrc
#
# .SYNOPSIS
#   Shell initialization script for interactive sessions.
#
# .DESCRIPTION
#   This script is executed whenever a new interactive shell session is started.
#   It sets up environment variables, command aliases, toolchains (e.g., SDKMAN),
#   and customizations to improve the user shell experience.
#
# .PARAMETER N/A
#   This file does not accept parameters; it's sourced automatically by the shell.
#
# .INPUTS
#   None
#
# .OUTPUTS
#   Environment settings, shell behavior configurations, and aliases.
#
# .NOTES
#   Version       : 1.2
#   Author        : @ZouariOmar <zouariomar20@gmail.com>
#   Created       : 2025-09-12
#   Change Log    : 58a8d8a
#
# .EXAMPLE
#   N/A — this file is sourced automatically by the shell.
# ==================================================================================

# Exit the script immediately if any command fails
set -e

# Set bash header theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/${POSH_THEME}.omp.json)"

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Git Aliases
# For More aliases, see https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc
alias lg='lazygit' # Open `lazygit`

# Docker Aliases
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# Navigation Aliases
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
alias ofe="xdg-open ."   # Open File Explorer in current directory

# System Management Aliases
alias wmi="whoami"                                                               # Display the current username
alias c="clear"                                                                  # Clear the terminal screen
alias h="history"                                                                # Show command history
alias mkd="mkdir -pv"                                                            # Make a directory and all parent directories with verbosity and go into it
alias df="df -h"                                                                 # Show disk usage with human-readable units
alias top="htop"                                                                 # Use htop for a more interactive process monitor
alias hostname="cat /etc/hostname"                                               # Show the hostname
alias wordlists='ll /usr/share/wordlists'                                        # Show your wordlists sets
alias cc="sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches"                         # Drops all pagecache, dentries, and inodes from the RAM
alias kp='keepassxc-cli'                                                         # Shortcut for `keepassxc-cli`
alias "xc=xclip -selection clipboard"                                            # Copy the content into the clipboard (ensures it goes to the standard Ctrl+C/Ctrl+V clipboard)
alias neof='neofetch --config /home/zouari_omar/.config/neofetch/acenoster.conf' # Custom Alias for neofetch

# Arch Aliases
alias pacu="sudo pacman -Syu"                  # Updating package database and upgrading system
alias pacc="sudo pacman -Sc"                   # Clearing unused pacman cache
alias paccc="sudo pacman -Rns $(pacman -Qtdq)" # Remove unused pacman packages
alias pacls="pacman -Qs"                       # List all installed pacman packages
alias paci="sudo pacman -Sy"                   # Install pacman package
alias pacrm="sudo pacman -Rns"                 # Remove a specific pacman package
alias yayu="yay -Syu"                          # Update all installed packages using yay
alias yayc="yay -Sc"                           # Clean up unnecessary package files using yay
alias yaycc="yay -Rns $(yay -Qtdq)"            # Remove unused yay packages
alias yayls="yay -Qs"                          # List all installed AUR packages
alias paci="yay -Sy"                           # Install AUR package
alias yayrm="sudo yay -Rns"                    # Remove a specific yay package

# Network Aliases
alias prvip="ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1" # Get Private IP Address
alias pubip="curl -s ifconfig.me"                                               # Get Public IP Address
alias shark='sudo tshark --color'                                               # WireShark CLI with colors | Add -l for line-buffered (live monitoring mode)

# Editor(s) Aliases
alias v='vim'
alias nv='nvim'

# C, C++ & Python Aliases
alias g++='g++ -std=c++23 -Wall -Wextra -Wpedantic -O2'
alias gcc='gcc -std=c17 -Wall -Wextra -Wpedantic -O2'
alias jlab='jupyter-lab'

# -----------------------------------------
# .FUNCTION
#   pacnews
# .SYNOPSIS
#   Show latest Arch Linux news before upgrading
# .DESCRIPTION
#   pacnews <latest_news_number>
#   Fetches the latest news entries from the Arch Linux website and displays
#   them in the terminal. After showing the news, prompts the user whether
#   to proceed with a system upgrade via `sudo pacman -Syu`.
# .USAGE
#   pacnews 5      # Show the 5 most recent Arch Linux news items
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-07
# -----------------------------------------
pacnews() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: pacnews <latest_news_number>"
    return 1
  fi

  echo "Latest Arch Linux news:"
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
    echo "Upgrade cancelled."
  fi
}

# -----------------------------------------
# .FUNCTION
#   n
# .SYNOPSIS
#   Launch the `nnn` terminal file manager and return to the last visited directory
# .DESCRIPTION
#   n [options]
#   Opens `nnn` (a terminal file manager) with the given options.  
#   When you exit `nnn`, the function automatically changes the shell's current
#   directory to the last visited directory recorded by `nnn`.
# .USAGE
#   n              # Launch `nnn` normally
#   n -d /path     # Launch `nnn` starting at a specific directory
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-07
# -----------------------------------------
n() {
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE"
  fi
}

# -----------------------------------------
# .FUNCTION
#   kpg
# .SYNOPSIS
#   Copy a KeepassXC entry attribute to the clipboard
# .DESCRIPTION
#   kpg <attribute> <entry>
#   Uses keepassxc-cli to fetch a specific attribute (like password or username)
#   from a KeepassXC database entry and copies it to the clipboard via xclip.
# .USAGE
#   kpg password "MyEmailAccount"
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-07
# -----------------------------------------
kpg() {
  if [[ $# -ne 2 ]]; then
    echo -e "${YELLOW}[Usage]${RESET} kpg <attribute> <entry>"
    return ${EXIT_FAILURE}
  fi
  KDBX_PATH="path_to_your_db.kdbx"
  entry=$2
  attribute=$1
  (keepassxc-cli show -sa "${attribute}" "${KDBX_PATH}" "${entry}" | xclip -selection clipboard) &&
    echo -e "${GREEN}Copied To Clipboard!${RESET}"
}

# -----------------------------------------
# .FUNCTION
#   st0
# .SYNOPSIS
#   Share temporary file via 0x0.st and copy URL to clipboard
# .DESCRIPTION
#   st0 <shared_info>
#   Takes the output of a command or file content, uploads it to 0x0.st,
#   and copies the resulting URL to the clipboard using xclip.
# .USAGE
#   st0 "cat myfile.txt"
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-07
# -----------------------------------------
st0() {
  if [[ $# -ne 1 ]]; then
    echo -e "${YELLOW}[Usage]${RESET} st0 <shared_info>"
    return ${EXIT_FAILURE}
  fi
  shared_info=$1
  ${shared_info} | curl -F 'file=@-' 0x0.st | xclip -selection clipboard
}

# -----------------------------------------
# .FUNCTION
#   oracle
# .SYNOPSIS
#   Oracle database docker manager
# .DESCRIPTION
#   oracle start - Starts the Oracle Database container and logs in via SQL*Plus.
#   oracle stop  - Stops the Oracle Database container.
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-01-28
# -----------------------------------------
oracle() {
  if [ "$#" -ne 1 ]; then
    echo -e "${YELLOW}Usage: oracle <start|stop>${RESET}"
    return 1
  fi
  ORACLE_DB_ID="oracle-db"
  ACTION=$1

  case ${ACTION} in
  'start')
    echo -e "${GREEN}Starting oracle database container...${RESET}"
    sudo systemctl start docker                        # Start the docker service²
    docker login                                       # Login to docker
    docker start ${ORACLE_DB_ID}                       # Start oracle container
    docker exec -it oracle-db bash -c "lsnrctl status" # Check Oracle listener status
    docker exec -it oracle-db bash                     # Enter the container bash
    ;;
  'stop')
    echo -e "${GREEN}Stopping oracle database container...${RESET}"
    docker stop ${ORACLE_DB_ID} # Stop oracle container
    docker logout               # Logout from docker
    sudo systemctl stop docker  # Stop docker service
    ;;
  *)
    echo -e "${RED}Invalid option!\n${YELLOW}Usage: oracle <start|stop>${RESET}"
    return 1
    ;;
  esac
}

# Set PIO
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# Set Android SDK home
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# Set Symfony
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# Set SDKMAN (for JVM toolchains)
# See https://github.com/ZouariOmar/dot-files/blob/ba66e63e66659133b5a73090e918925d86e716d9/bash/.bashrc

# Set Bash
BASH_HOME="$HOME/.bash"

# Set EDITOR
export EDITOR="nv"

# Set JAVA
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH

# Set MAVEN
export M2_HOME="$HOME/.m2"

# Set npm
NPM_GLOBAL_HOME="$HOME/.npm-global"
export PATH="$NPM_GLOBAL_HOME/bin:$PATH"

# Set NVM_DIR && load `nvm`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Set LOCAL_BIN && load it
LOCAL_BIN="$HOME/.local/bin"
export PATH="$LOCAL_BIN:$PATH"

# Init custom colors
[[ -s $BASH_HOME/.bash_colors ]] && source "$BASH_HOME/.bash_colors"

# Enable bash completion features
[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Init sdkman
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# Init nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Enable nvm bash_completion

# Load angular cli autocompletion
source <(ng completion script)
