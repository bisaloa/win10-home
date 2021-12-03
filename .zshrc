# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.home/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history

# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus

# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Other
setopt prompt_subst

# Plugins
source <(antibody init)
antibody bundle < ~/.home/.zsh_plugins.txt > ~/.home/.zsh_plugins.sh

# Theme
antibody bundle romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.home/.p10k.zsh.
[[ ! -f ~/.home/.p10k.zsh ]] || source ~/.home/.p10k.zsh

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.home/.git-completion.bash
# Load docker completion
 if [ -f /usr/local/etc/bash_completion ]; then
 . /usr/local/etc/bash_completion
 fi

fpath=(~/.home $fpath)

# disable test highlight on paste
zle_highlight=('paste:none')

# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Setup python env
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup kubectl autocomplete
autoload -Uz compinit
compinit -i

[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

alias ipython='python -m IPython'
alias gf='git diff-tree --no-commit-id --name-only -r'
alias glh='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
alias k=kubectl
alias gpo="git push origin --set-upstream"
alias sudo='sudo '
# complete -F __start_kubectl k

echo "source ~/.home/.vimrc" >> ~/.vimrc

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word