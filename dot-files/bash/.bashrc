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

# Set bash theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/${POSH_THEME}.omp.json)"

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Set bash home
BASH_HOME="$HOME/.bash"

# Enable bash completion features
[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Init bash colors
[[ -s ${BASH_HOME}/.bash_colors ]] && . "${BASH_HOME}/.bash_colors"

# Init bash aliases
[[ -s ${BASH_HOME}/.bash_aliases ]] && . "${BASH_HOME}/.bash_aliases"

# Init bash functions
[[ -s ${BASH_HOME}/.bash_functions ]] && . "${BASH_HOME}/.bash_functions"

# Init bash loaders
[[ -s ${BASH_HOME}/.bash_loaders ]] && . "${BASH_HOME}/.bash_loaders"

# Load bash dev news
[[ -s ${BASH_HOME}/.bash_dev_news ]] && . "${BASH_HOME}/.bash_dev_news"

# ==================================================================================
# End of .bashrc
# ==================================================================================
