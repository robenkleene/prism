#!/bin/bash

__prism_previous_extglob_setting=$(shopt -p extglob)
shopt -s extglob

__prism_complete_commands() {
    COMPREPLY=( $(compgen -W "${commands[*]}" -- "$cur") )
}

_prism_prism() {
    __prism_complete_commands
}

_prism() {
    local previous_extglob_setting=$(shopt -p extglob)
    shopt -s extglob

    local commands=(
        --raw
        --commit-style
        --dark
        --file-style
        --help
        --highlight-removed
        --hunk-style
        --light
        --list-languages
        --list-themes
        --list-theme-names
        --minus-color
        --minus-emph-color
        --plus-color
        --plus-emph-color
        --keep-plus-minus-markers
        --show-background-colors
        --theme
        --version
        --width
    )

    COMPREPLY=()
    local cur prev words cword
    _get_comp_words_by_ref -n : cur prev words cword

    local command='prism' command_pos=0
    local counter=1
    while [ $counter -lt $cword ]; do
      case "${words[$counter]}" in
          *)
              command="${words[$counter]}"
              command_pos=$counter
              break
              ;;
      esac
      (( counter++ ))
    done

    local completions_func=_prism_${command}

    declare -F $completions_func >/dev/null && $completions_func

    eval "$previous_extglob_setting"
    return 0
}

eval "$__prism_previous_extglob_setting"
unset __prism_previous_extglob_setting

complete -F _prism -A file prism
