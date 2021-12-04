export warender=/mnt/c/users/warender
export encoluis=/mnt/d/users/encoluis

export FZF_DEFAULT_OPTS='--height 50% --no-reverse'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
# export FZF_CTRL_T_OPTS="--no-height --preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="--no-height --preview-window 'wrap' --preview '(bat --style=plain --color=always {} || tree -C {}) 2> /dev/null | head -500'"
