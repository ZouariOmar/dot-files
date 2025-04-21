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

# Git Aliases
alias ga="git add"             # Add files to staging
alias gaa='git add --all'      # Add all files to Git
alias gc="git commit"          # Commit changes
alias gca="git commit --amend" # Amend the last commit
alias gc="git checkout"        # Checkout a branch or file
alias gcb='git checkout -b'    # Create a new Git branch and move to the new branch at the same time
alias gl="git log --oneline"   # Show the log as a single line
alias gs="git status"          # Check the status of your git repo
alias gd='git diff'            # View the difference

# System Management Aliases
alias sysu="sudo pacman -Syu" # Updating package database and upgrading system
alias sysc="sudo pacman -Sc"  # Clearing unused package cache
alias yayu="yay -Syu"         # Update all installed packages using yay
alias yayc="yay -Sc"          # Clean up unnecessary package files using yay
alias lspacman="pacman -Q"    # List All Installed pacman Packages
alias cpacman="sudo pacman -R $(pacman -Qtdq)" # Remove unused packages
alias lsyay="yay -Qdt"        # List All Installed AUR Packages
alias wmi="whoami"            # Display the current username
alias c="clear"               # Clear the terminal screen
alias h="history"             # Show command history
alias mkd='mkdir -p -v'       # Make a directory and all parent directories with verbosity
alias df="df -h"              # Show disk usage with human-readable units
alias top="htop"              # Use htop for a more interactive process monitor

# Network Aliases
alias private_ip="ip a | grep inet | grep -v inet6 | awk '{print $2}' | cut -d/ -f1" # Get Private IP Address
alias public_ip="curl -s ifconfig.me"                                                # Get Public IP Address

# Docker Aliases
alias dps="docker ps"          # List running containers
alias dimages="docker images"  # List Docker images
alias dbuild="docker build -t" # Build a Docker image
alias dstop="docker stop"      # Stop a running container

# Check if the bash-completion script exists at /usr/share/bash-completion/bash_completion.
# If it does, source the script to enable bash completion features.
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# The `service` function provides a shorthand for managing system services using systemctl.
# It requires exactly two arguments:
#   1. <action>: The action to perform (e.g., start, stop, restart, status).
#   2. <service_name>: The name of the service to manage (e.g., apache2, mariadb, nginx).
#
# Usage:
#   service <action> <service_name>
# Example:
#   service start apache2
#   service restart mariadb
#
# If the function is called with an incorrect number of arguments, it displays an error message
# and exits without executing the command.
#
# Arguments:
#   "$@" - Passes all provided arguments to the `systemctl` command.
# Returns:
#   1 - If the number of arguments is not equal to 2.
#   0 - If the command executes successfully.
service() {
    if [ "$#" -ne 2 ]; then
        echo "Error: This function requires exactly 2 arguments."
        echo "Usage: service <action> <service_name>"
        return 1
    fi
    sudo systemctl "$@"
}

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

# Oracle Database Management Function
# This function starts or stops an Oracle Database container running in Docker.
# Usage:
#   oracle start - Starts the Oracle Database container and logs in via SQL*Plus.
#   oracle stop  - Stops the Oracle Database container.
oracle() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: oracle <start|stop>"
        return 1
    fi

    case $1 in
    'start')
        echo "Starting Oracle Database container..."

        # Enable and start the Docker service
        sudo systemctl enable docker
        sudo systemctl start docker

        # Login to Docker
        docker login

        # Start Oracle container
        docker start oracle-db

        # Export Oracle library path
        export LD_LIBRARY_PATH=/usr/local/lib/oracle:$LD_LIBRARY_PATH

        # Check Oracle listener status
        docker exec -it oracle-db bash -c "lsnrctl status"

        # Log into SQL*Plus inside the container
        docker exec -it oracle-db sqlplus sys/sys@//localhost:1521/orclpdb1 as sysdba
        ;;
    'stop')
        echo "Stopping Oracle Database container..."

        # Stop Oracle container
        docker stop oracle-db

        # Logout from Docker
        docker logout

        # Stop and disable Docker service
        sudo systemctl disable docker
        sudo systemctl stop docker
        ;;
    *)
        echo "Invalid option. Usage: oracle <start|stop>"
        return 1
        ;;
    esac
}
