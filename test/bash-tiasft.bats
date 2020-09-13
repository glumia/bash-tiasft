#!/usr/bin/env bats

@test "should match a shortcut" {
    # Define some aliases
    alias ll='ls -lh'
    alias la='ls -la'
    
    # Import the search function
    source "${BATS_TEST_DIRNAME}/../bash-tiasft.sh"

    # Check result 
    result=$(search_alias 'ls -lh')
    expected="There is a shortcut for that!""\n    alias ll='ls -lh'"
    run diff <(echo "$result") <(echo -e "$expected")
    [ $status -eq 0 ]
}

@test "should match the most powerful shortcut" {
    alias g='git'
    alias grs='git reset'
    alias grsh='git reset --hard'
    
    source "${BATS_TEST_DIRNAME}/../bash-tiasft.sh"
    
    result=$(search_alias 'git reset --hard origin/master')
    expected="There is a shortcut for that!""\n    alias grsh='git reset --hard'"
    run diff <(echo "$result") <(echo -e "$expected")
    [ $status -eq 0 ]  
}

