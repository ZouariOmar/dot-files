# ==================================================================================
# .FILE
#   .bash_functions
#
# .SYNOPSIS
#   Shell customization script defining interactive functions for Arch/AUR management,
#   networking, color utilities, file management, KeepassXC integration, file sharing,
#   and Docker/Oracle management.
#
# .DESCRIPTION
#   This file is sourced in interactive Bash sessions. It provides reusable functions
#   that simplify tasks such as package maintenance, system upgrades, private IP detection,
#   advanced color printing, temporary file sharing, database management, and password management.
#
# .PARAMETER N/A
#   Functions are invoked interactively with their respective parameters.
#
# .INPUTS
#   Function-specific parameters.
#
# .OUTPUTS
#   Executes commands or returns results to stdout/clipboard as per function design.
#
# .NOTES
#   Version       : 1.0
#   Author        : @ZouariOmar <zouariomar20@gmail.com>
#   Created       : 2026-03-13
# ==================================================================================

# Load in Bash sessions
[ -n "${BASH_VERSION:-}" ] || return 0

# ==================================================================================
# Arch / AUR Package functions
# ==================================================================================

# -----------------------------------------
# .FUNCTION
#   paccc
# .SYNOPSIS
#   Remove orphaned pacman packages
# .DESCRIPTION
#   Identifies orphaned packages (not required by other packages) and removes them.
# .USAGE
#   paccc
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-13
# -----------------------------------------
paccc() {
  local pkgs
  pkgs=$(pacman -Qtdq)
  [ -n "$pkgs" ] && sudo pacman -Rns $pkgs
}

# -----------------------------------------
# .FUNCTION
#   yaycc
# .SYNOPSIS
#   Remove orphaned yay/AUR packages
# .DESCRIPTION
#   Identifies orphaned AUR packages and removes them.
# .USAGE
#   yaycc
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-13
# -----------------------------------------
yaycc() {
  local pkgs
  pkgs=$(yay -Qtdq)
  [ -n "$pkgs" ] && sudo yay -Rns $pkgs
}

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
    echo -e "${YELLOW}Usage:${RESET} pacnews <latest_news_number>"
    return 1
  fi

  local url="https://archlinux.org/news/"

  echo -e "${BLUE}Latest Arch Linux news:${RESET}"
  curl -s ${url} |
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

# ==================================================================================
# Network functions
# ==================================================================================

# -----------------------------------------
# .FUNCTION
#   prvip
# .SYNOPSIS
#   Get private IPv4 addresses
# .USAGE
#   prvip
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-13
# -----------------------------------------
prvip() {
  ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1
}

# ==================================================================================
# Background / Foreground colors functions
# ==================================================================================

FG_256() { echo -e "\e[38;5;${1}m"; }           # 256-color foreground -- Usage: FG_256 [0..256]
BG_256() { echo -e "\e[48;5;${1}m"; }           # 256-color background -- Usage: BG_256 [0..256]
RGB_FG() { echo -e "\e[38;2;${1};${2};${3}m"; } # Truecolor foreground -- Usage: RGB_FG [0..256] [0..256] [0..256]
RGB_BG() { echo -e "\e[48;2;${1};${2};${3}m"; } # Truecolor background -- Usage: RGB_BG [0..256] [0..256] [0..256]

# ==================================================================================
# File Manager / System Utilities
# ==================================================================================

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
#   Fetch a KeepassXC entry attribute
# .DESCRIPTION
#   kpg <attribute> <entry>
#   Fetches a specific attribute (e.g., password, username, token) from a KeepassXC
#   database entry using keepassxc-cli. By default, it copies the value to the clipboard.
#   If used in command substitution, it outputs the value to stdout instead.
# .USAGE
#   # Copy password to clipboard
#   kpg password "MyEmailAccount" | xc
# .AUTHOR
#   @ZouariOmar (zouariomar20@gmail.com)
# .CREATED
#   2026-03-13
# -----------------------------------------
kpg() {
  if [[ $# -ne 2 ]]; then
    echo -e "${YELLOW}[Usage]${RESET} kpg <attribute> <entry>"
    return 1
  fi

  local KDBX_PATH="to_your_database.kdbx"
  local KEYFILE="to_your_kdbx_key.key"
  local entry=$2
  local attribute=$1
  local value

  # Fetch the requested attribute from the specified entry
  value=$(keepassxc-cli show -sa "$attribute" "$KDBX_PATH" "$entry" --key-file "${KEYFILE}")

  if [[ -t 1 ]]; then
    echo "$value" | xclip -selection clipboard
    echo -e "${GREEN}Copied To Clipboard!${RESET}"
  else
    echo "$value"
  fi
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

# ==================================================================================
# Docker / Oracle Database functions
# ==================================================================================

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

# ==================================================================================
# End of .bash_functions
# ==================================================================================
