# lots of inspo taken from
# https://github.com/bttger/my-zsh/tree/main


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-.]=** r:|=**'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hamza/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# 

# arabic diactritcs
setopt COMBINING_CHARS

# aliases 
alias ls='eza --icons=always --header'
alias tree='ls -T'
alias grep='grep --color=always'
alias ip='ip --color=always'
alias less='less -R'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dotfileslazy='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias lvim='NVIM_APPNAME=lazyvim nvim'

alias l=ls
alias ll='ls -l'
alias la='ls -a'

# git binds
alias gi='git init'
alias gs='git status'
alias gp='git push'
alias gpl='git pull'
alias gb='git branch'
alias gc='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias ga='git add'

alias cat=bat
alias ssh='kitten ssh'

# Key bindings
# Print current key bindings: bindkey
# List available key bindings: bindkey -l
# Interactively show pressed key when pressing any keys
bindkey "^[[H" beginning-of-line # HOME
bindkey "^[[F" end-of-line # END
bindkey "^[[3~" delete-char # DEL
bindkey "^[[3;5~" delete-word # CTRL+DEL - delete a whole word after cursor
bindkey "^H" backward-delete-word # CTRL+BACKSPACE - delete a whole word before cursor
bindkey "^[[1;5C" forward-word # CTRL+ARROW_RIGHT - move cursor forward one word
bindkey "^[[1;5D" backward-word # CTRL+ARROW_LEFT - move cursor backward one word
bindkey "^Z" undo # CTRL+Z
bindkey "^Y" redo # CTRL+Y

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# fzf setup
# source <(fzf --zsh)

# starship
eval "$(starship init zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export MANPAGER=nvimpager

# pnpm
export PNPM_HOME="/home/hamza/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# cargo
export PATH=$PATH:/home/hamza/.cargo/bin

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Must go last (see https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-start tmux if not already in a session
# chatgpt
# if command -v tmux >/dev/null 2>&1; then
#   [ -z "$TMUX" ] && [ -n "$PS1" ] && exec tmux
# fi

export PATH="$HOME/.local/bin:$PATH"

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
