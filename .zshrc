PATH=/usr/local/opt/python/libexec/bin:/Users/libe/Library/Python/3.7/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin

PS1='%B%F{7}%n%f%b %F{67}( %2~ )%f %F{1}>>%f '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/libe/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/libe/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/libe/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/libe/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#bindkey -v

#function zle-line-init zle-keymap-select {
    #RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    #RPS2=$RPS1
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

#terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
#function zle-line-init zle-keymap-select {
    #PS1_2="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    #PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}%~ %# "
    #zle reset-prompt
#}
#preexec () { echo -rn -- $terminfo[el]; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/libe/.ghcup/env" ] && source "/Users/libe/.ghcup/env" # ghcup-env
alias gcc='gcc-12'
alias g++='g++-12'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/libe/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/libe/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/libe/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/libe/Desktop/google-cloud-sdk/completion.zsh.inc'; fi

export GLM_INCLUDE_DIR=/Users/libe/Desktop/School/TAMU/Senior/CSCE441/glm
export GLFW_DIR=/Users/libe/Desktop/School/TAMU/Senior/CSCE441/glfw
export GLEW_DIR=/Users/libe/Desktop/School/TAMU/Senior/CSCE441/glew-2.1.0

# Created by `pipx` on 2024-07-15 19:02:58
export PATH="$PATH:/Users/libe/.local/bin"
