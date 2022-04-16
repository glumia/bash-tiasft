#!/bin/bash
#
# bash-tiasft.sh -- Suggest shortcuts for aliased commands.
# https://github.com/glumia/bash-tiasft
#
#
# Before each command is executed this function checks if there's an alias 
# already defined for it and eventually suggests it. 
#
# Author: Giuseppe Lumia (gius@glumia.dev)
#
# v0.1.3
#

# General Usage:
#
#  1. Source this file in your bash profile before you source Bash-Preexec.
#
#  2. Use your terminal as usual, if you forget there's an alias you can use
#     for a command a message will be printed before it is executed.
#

# Avoid duplicate inclusion
if [[ "${__btiasft_imported:-}" == "defined" ]]; then
    return 0
fi
__btiasft_imported="defined"

# Cache user's aliases at login, no need to execute the `alias` command each
# time.
__aliases=$(alias)

# Take the command string and progressively search if there is an alias defined
# for it, removing the last word at each iteration.
function search_alias {
    local cmd shortcut
    IFS=" " read -ra cmd <<< "$1"
    shortcut=""
    while [[ -z "${shortcut}"  &&  "${#cmd[@]}" -gt 0 ]]; do
        shortcut=$(grep "[^=]*[\"\']${cmd[*]}[\'\"]" <<< "${__aliases}")
        unset "cmd[${#cmd[@]}-1]"
    done
    if [[ -n "${shortcut}" ]]; then
        printf "There is a shortcut for that!\n    %s\n" "${shortcut}"
    fi
}

# Add the function just declared to the preexec_functions.
preexec_functions+=(search_alias)

