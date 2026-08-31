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
#   Version       : 1.4
#   Author        : @ZouariOmar (zouariomar20@gmail.com)
#   Created       : 2026-07-16
#   Change Log    : 316022d
#
# .EXAMPLE
#   N/A — this file is sourced automatically by the shell.
# ==================================================================================

# Bash theme
POSH_THEME="blue-owl"
eval "$(oh-my-posh init bash --config /home/zouari_omar/.local/share/themes/${POSH_THEME}.omp.json)"

# Bash history mode
HISTCONTROL=ignoredups

# Bash home
BASH_HOME="$HOME/.bash"

# Bash completion
[[ -s /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Bash helper(s)
if [ -d "$BASH_HOME" ]; then
  for file in "$BASH_HOME"/.[!.]*; do
    if [ -s "$file" ]; then
      # shellcheck disable=SC1090
      . "$file"
    fi
  done
fi
