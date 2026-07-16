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
#   Version       : 1.3
#   Author        : @ZouariOmar (zouariomar20@gmail.com)
#   Created       : 2026-07-16
#   Change Log    : 316022d
#
# .EXAMPLE
#   N/A — this file is sourced automatically by the shell.
#
# shellcheck disable=SC1091
# ==================================================================================

# Bash theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/${POSH_THEME}.omp.json)"

# Ignore duplicate commands in the history
HISTCONTROL=ignoredups

# Bash home
BASH_HOME="$HOME/.bash"

# Bash completion
[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Bash colors
[[ -s ${BASH_HOME}/.bash_colors ]] && . "${BASH_HOME}/.bash_colors"

# Bash aliases
[[ -s ${BASH_HOME}/.bash_aliases ]] && . "${BASH_HOME}/.bash_aliases"

# Bash functions
[[ -s ${BASH_HOME}/.bash_functions ]] && . "${BASH_HOME}/.bash_functions"

# Bash loaders
[[ -s ${BASH_HOME}/.bash_loaders ]] && . "${BASH_HOME}/.bash_loaders"

# Bash news
[[ -s ${BASH_HOME}/.bash_news ]] && . "${BASH_HOME}/.bash_news"
