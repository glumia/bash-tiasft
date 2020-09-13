#!/usr/bin/env bats

@test "should not import if it's already defined" {
    __btiasft_imported="defined"
    unset search_alias
    source "${BATS_TEST_DIRNAME}/../bash-tiasft.sh"
    [ -z $(type -t search_alias) ]
}

@test "should import if not defined" {
    unset __btiasft_imported
    source "${BATS_TEST_DIRNAME}/../bash-tiasft.sh"
    [ -n $(type -t search_alias) ]
    [ -n $(echo ${preexec_functions[@]} | grep '\bsearch_alias\b') ]
    [ -n $(type -t __btiasft_imported) ]
}
    
  
