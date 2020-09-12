# bash-tiasft.sh -- Suggest shortcuts for bash commands that have an alias.
# https://github.com/glumia/bash-tiasft
#
#
# Before each command is executed this function checks if there's an alias 
# already defined for it and eventually suggests it. 
#
# Author: Giuseppe Lumia (glumia@protonmail.com)
#
# V0.1.0-alpha
#

# General Usage:
#
#  1. Source this file in your bash profile before you source Bash-Preexec
#

# Avoid duplicate inclusion
if [[ "${__btiasft_imported:-}" == "defined" ]]; then
    return 0
fi
__btiasft_imported="defined"

# Take the command string and progressively search if there is an alias defined
# for it, removing the last word at each iteration.
function search_alias {
    cmd=($*)
    shortcut=""
    while [[ -z "$shortcut" && -n "${cmd[*]}" ]]; do
        while read line; do
            if [[ -n $(echo "$line" | cut -d'=' -f2 | grep "^[\'\"]${cmd[*]}") ]]; then
                shortcut=$line
                break
            fi
        done <<< $(alias)
        unset cmd[-1]
    done
    if [[ -n "$shortcut" ]]; then
        echo "There is a shortcut for that!"
        echo "    $shortcut"
        echo ""
    fi
}

# TODO: Implement the search algorithm in C, it's really too slow in bash. 

# Add the function just declared to the preexec_functions.
preexec_functions+=(search_alias)

