#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# a better prompt with current git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias start_dev_conda="source /cds/group/pcds/pyps/conda/dev_conda # for pcds_group conda"

# some env variables
export GITHUB_USER=tangkong
export EDITOR=vim
export DOTFILES=$HOME/dotfiles
export PATH=$DOTFILES/bin:$HOME/.local/bin:$PATH

# source aliases
soure $DOTFILES/aliases

# source production env
source /cds/group/pcds/pyps/conda/pcds_conda
# Source epics env variables and useful shortcuts
source /reg/g/pcds/setup/epicsenv-cur.sh
source /reg/g/pcds/setup/pcds_shortcuts.sh


# Add development folder to PYTHONPATH
export PYTHONPATH=$PYTHONPATH:"$(printf '%s:' ~/devrepos/*/)"


# source /cds/home/r/roberttk/miniconda3/bin/conda

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/cds/home/r/roberttk/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/cds/home/r/roberttk/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/cds/home/r/roberttk/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/cds/home/r/roberttk/miniconda3/bin:$PATH"
#    fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

