export LANG="en_US.UTF-8"
export LC_ALL=$LANG
export EDITOR="nvim"
export VISUAL="nvim"

export CACHE_DIR="${HOME}/.cache"
export _FASD_DATA="${CACHE_DIR}/.fasd" # set fasd data file location
export ZPLUG_HOME="${HOME}/.zplug"

# export GREP_OPTIONS='--color=auto';

# export PATH="/${HOME}/anaconda3/bin:$PATH"
source activate python35
#export PATH="/usr/local/git:$PATH"

alias nv="nvim"

setopt glob_dots # Do not require leading ´.´ in filename to be matched

#source ~/.dotfiles/.zshrc_private

source ~/.zplug/init.zsh

zplug "zplug/zplug"
#zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git", from:oh-my-zsh, nice:10
zplug "plugins/vi-mode", from:oh-my-zsh, nice:10
zplug "plugins/fasd", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/directories.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/completion.zsh"
#zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh" # Uses emacs bindings
zplug "robbyrussell/oh-my-zsh", use:"lib/theme-and-appearance.zsh"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "mafredri/zsh-async", on:sindresorhus/pure
zplug "sindresorhus/pure", nice:10
#zplug "themes/pure", from:oh-my-zsh
#zplug "frmendes/geometry"

zplug check || zplug install
zplug load

export PURE_CMD_MAX_EXEC_TIME=60

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^[[Z' reverse-menu-complete

bindkey -s 'ö' '['
bindkey -s 'ä' ']'
bindkey -s 'Ö' '{'
bindkey -s 'Ä' '}'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#autoload -U compinit && compinit

# history settings
export HISTSIZE=100000
export SAVEHIST=100000
#export HISTCONTROL=ignoredups # no duplicate lines or lines starting with space
export HISTFILE="${CACHE_DIR}/.zsh_history"
setopt inc_append_history
setopt hist_ignore_dups
# setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
# setopt hist_save_no_dups

