# Set up the prompt

autoload -Uz promptinit
promptinit
prompt suse 
PROMPT='%B%F{magenta}%n@%M %F{yellow}%~>%f '
RPROMPT='%D{%d-%m-%Y} %*'

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Alias
alias ls='ls --color=auto'
alias ll='ls -al'
alias l='ll'
alias c='cd ..'
alias got='git '
alias get='git '

# Bindkey

bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3A" up-line-or-search
bindkey "^[[1;3B" down-line-or-search


export PATH=/home/athouverey/spark-2.1.0-bin-hadoop2.7/bin:$PATH
export PATH=/home/athouverey/sbt/bin:$PATH


# meteo
function wth() {
  curl http://wttr.in/$1
}
alias weather=wth
alias meteo=wth
