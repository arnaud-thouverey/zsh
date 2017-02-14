# Set up the prompt

autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory
setopt extended_glob

# rename files
autoload -U zmv

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
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

##########
# Bindkey
##########
bindkey "\e$terminfo[kcuu1]" up-line-or-search
bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word
bindkey "\e$terminfo[kcud1]" down-line-or-search


################
# Prompt
################

unset PROMPT

COLOR_BEG=`echo "%{\e["`
COLOR_END=`echo "m%}"`

DEFAULT_COLOR="${COLOR_BEG}0${COLOR_END}"

BLACK="${COLOR_BEG}0;30${COLOR_END}"
RED="${COLOR_BEG}0;31${COLOR_END}"
GREEN="${COLOR_BEG}0;32${COLOR_END}"
YELLOW="${COLOR_BEG}0;33${COLOR_END}"
BLUE="${COLOR_BEG}0;34${COLOR_END}"
MAGENTA="${COLOR_BEG}0;35${COLOR_END}"
CYAN="${COLOR_BEG}0;36${COLOR_END}"
WHITE="${COLOR_BEG}0;37${COLOR_END}"

BLACK_BOLD="${COLOR_BEG}1;30${COLOR_END}"
RED_BOLD="${COLOR_BEG}1;31${COLOR_END}"
GREEN_BOLD="${COLOR_BEG}1;32${COLOR_END}"
YELLOW_BOLD="${COLOR_BEG}1;33${COLOR_END}"
BLUE_BOLD="${COLOR_BEG}1;34${COLOR_END}"
MAGENTA_BOLD="${COLOR_BEG}1;35${COLOR_END}"
CYAN_BOLD="${COLOR_BEG}1;36${COLOR_END}"
WHITE_BOLD="${COLOR_BEG}1;37${COLOR_END}"

BCK_BLACK="${COLOR_BEG}0;40${COLOR_END}"
BCK_RED="${COLOR_BEG}0;41${COLOR_END}"
BCK_GREEN="${COLOR_BEG}0;42${COLOR_END}"
BCK_YELLOW="${COLOR_BEG}0;43${COLOR_END}"
BCK_BLUE="${COLOR_BEG}0;44${COLOR_END}"
BCK_MAGENTA="${COLOR_BEG}0;45${COLOR_END}"
BCK_CYAN="${COLOR_BEG}0;46${COLOR_END}"
BCK_WHITE="${COLOR_BEG}0;47${COLOR_END}"

BCK_BLACK_BOLD="${COLOR_BEG}1;40${COLOR_END}"
BCK_RED_BOLD="${COLOR_BEG}1;41${COLOR_END}"
BCK_GREEN_BOLD="${COLOR_BEG}1;42${COLOR_END}"
BCK_YELLOW_BOLD="${COLOR_BEG}1;43${COLOR_END}"
BCK_BLUE_BOLD="${COLOR_BEG}1;44${COLOR_END}"
BCK_MAGENTA_BOLD="${COLOR_BEG}1;45${COLOR_END}"
BCK_CYAN_BOLD="${COLOR_BEG}1;46${COLOR_END}"
BCK_WHITE_BOLD="${COLOR_BEG}1;47${COLOR_END}"

MAIN_COLOR=$MAGENTA_BOLD
ALT_COLOR=$YELLOW_BOLD

export PS1="${ALT_COLOR}[${MAIN_COLOR}%n${ALT_COLOR}@${MAIN_COLOR}%m${ALT_COLOR}] ${ALT_COLOR}%~> ${DEFAULT_COLOR}"
export PS2="${ALT_COLOR}%_> ${DEFAULT_COLOR}"
export RPROMPT="${MAIN_COLOR}%D{%a %d %R}${DEFAULT_COLOR}"

#############
# Alias
############
alias ls='ls --color=auto'
alias ll='ls -la'
alias c='cd ..'

function wth() {
  curl http://wttr.in/$1
}
alias weather=wth
alias meteo=wth
eval $(thefuck --alias)

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rbenv/bin"
