# ==================================================================================
# .FILE
#   .bash_profile
#
# .SYNOPSIS
#   Login shell initialization script.
#
# .DESCRIPTION
#   This script is executed when a user logs into a Bash session. It is typically
#   responsible for configuring the login environment by setting environment
#   variables, updating the PATH, launching startup utilities, and sourcing
#   additional shell configuration files such as .bashrc when appropriate.
#
# .PARAMETER
#   N/A
#   This file does not accept parameters; it is sourced automatically by Bash
#   during login shell initialization.
#
# .INPUTS
#   None
#
# .OUTPUTS
#   Environment variables, PATH modifications, shell startup behavior, and
#   login session configuration.
#
# .NOTES
#   Version       : 1.0
#   Author        : @ZouariOmar (zouariomar20@gmail.com)
#   Created       : 2026-07-29
#   Change Log    : Initial documentation
#
# .EXAMPLE
#   N/A — this file is sourced automatically by Bash when a login shell starts.
# ==================================================================================

# shellcheck disable=SC1090
[[ -s ~/.bashrc ]] && . ~/.bashrc
