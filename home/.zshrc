#-----------------------------------------------------------
#
# @zee-bit's config files
# https://github.com/zee-bit/dotfiles
#
# Inspired from: Mrugesh Mohapatra <https://mrugesh.dev>
# Synced using homeshick <https://github.com/andsens/homeshick>
# License: MIT
#
# File name: .zshrc
#
#-----------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# No idea why, but this needs to be source'd at the top too...
[ -f ~/.oh-my-zsh.zshrc ] && source ~/.oh-my-zsh.zshrc

#-----------------------------------------------------------
# common configs
#-----------------------------------------------------------

# Use for profiling zsh, should be the first thing in the file
if [[ "$ZPROF" = true ]]; then
  zmodload zsh/zprof
fi

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Check if a command exists
# CREDIT: https://github.com/unixorn/zsh-quickstart-kit/blob/6e940dd38053b0a7c6c0208426d7a7ab798a3db7/zsh/.zshrc#L24-L26
function can_haz() {
  which "$@" >/dev/null 2>&1
}

#-----------------------------
# homeshick
#-----------------------------
source ~/.homesick/repos/homeshick/homeshick.sh
fpath=(~/.homesick/repos/homeshick/completions $fpath)

#-----------------------------
# fzf
#-----------------------------
if can_haz fzf; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  [ -f ~/.fzf.zshrc ] && source ~/.fzf.zshrc
  source /usr/share/doc/fzf/examples/completion.zsh
fi

#-----------------------------
# miniconda
#-----------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zean/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zean/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zean/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zean/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#-----------------------------
# powerlevel10k
#-----------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#-----------------------------
# broot
#-----------------------------
[ -d ~/.config/broot ] && source /home/zean/.config/broot/launcher/bash/br

#-----------------------------
# sfdx (Salesforce CLI)
#-----------------------------
if can_haz sfdx; then
    export PATH=~/sfdx/bin:$PATH
fi

#-----------------------------
# nvm
#-----------------------------
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm #bash_completion

#-----------------------------
# thefuck
#-----------------------------
if can_haz thefuck; then
    eval $(thefuck --alias fuck)
fi

#-----------------------------
# aliases and env settings
#-----------------------------
[ -f ~/.alias.zshrc ] && source ~/.alias.zshrc
[ -f ~/.profile ] && source ~/.profile

#-----------------------------
# Path and variable settings
#-----------------------------
export REVIEW_BASE=master
export FZF_COMPLETION_TRIGGER='**'
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#################################################
### Colorize Man pages
#################################################

export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export PATH="/usr/local/sbin:$PATH"

#################################################


# Use for profiling zsh, should be the last thing in the file
timezsh() {
  for i in $(seq 1 10); do time zsh -i -c exit; done
}

if [[ "$ZPROF" = true ]]; then
  zprof
fi

