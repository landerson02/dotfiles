export ZSH="$HOME/.oh-my-zsh"

# Ruby paths
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem env gemdir)/bin:$PATH"

# Conda stuff
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
export CONDA_CHANGEPS1=false


plugins=(
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

source $(dirname $(gem which colorls))/tab_complete.sh

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

# conda
alias cna="conda activate"
alias cnab="conda activate base"

# python
alias py="python"
alias py3="python3"

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

# prompt KEEP AT END
eval "$(starship init zsh)"
