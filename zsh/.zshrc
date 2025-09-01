export ZSH="$HOME/.oh-my-zsh"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Conda stuff - dont change
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
export CONDA_CHANGEPS1=false
if [[ -n "$CONDA_PREFIX" ]]; then
  export PATH="$CONDA_PREFIX/bin:$PATH"
fi

# EDITOR
export EDITOR='nvim'


#--------------------------------------KEYBINDS--------------------------------------#
# fzf
source <(fzf --zsh)
bindkey "ç" fzf-cd-widget
bindkey '^R' fzf-history-widget

# autosuggestions
bindkey '^ ' autosuggest-accept

#--------------------------------------ALIASES--------------------------------------#

# zsh
alias conf="nvim ~/.zshrc"
alias ref="source ~/.zshrc"

# colorls
alias l="colorls -A --sd"
alias ll="colorls -lA --sd"

# git
alias g="git"
alias lg="lazygit"
alias gst="git status"

# conda
alias cna="conda activate"
alias cnab="conda activate base"

# python
alias py="python3"

# pnpm
alias pm="pnpm"

# tmux
alias ta="tmux attach -t"
alias td="tmux detach -d -t"
alias tl="tmux list-sessions"
alias tk="tmux kill-session -t"
alias tka="tmux kill-server"
alias ts="tmux new-session -s"
alias tmuxconf="nvim ~/.tmux.conf"
alias tmuxref="tmux source-file ~/.tmux.conf"

# Cargo
alias cr="cargo run"
alias ct="cargo test"

# nvim
alias n="nvim"

# copy
alias clip="pbcopy <"

# eza
alias l='eza --git --icons -a --color=always --group-directories-first'
alias ll='eza --long --all --git --icons --color=always --group-directories-first --header'

eval "$(zoxide init zsh)"
# prompt KEEP AT END
eval "$(starship init zsh)"
