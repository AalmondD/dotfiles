
##Configuración personal
save_dots() {
    config add -u
    config commit -m "Update dotfiles: $(date)"
    config push origin main
}


#Configuración Prezto
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
#
#
#
alias gst='git status'
#
#
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/aalmondd/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/aalmondd/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/aalmondd/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/aalmondd/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
#
#
# Muestra el entorno de Conda en el prompt (compatible con agnoster)
_conda_sync_virtualenv() {
    if [[ -n $CONDA_PREFIX ]]; then
        export VIRTUAL_ENV="$CONDA_PREFIX"
    else
        unset VIRTUAL_ENV
    fi
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _conda_sync_virtualenv
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
