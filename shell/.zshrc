
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#setopt GLOB_DOTS

export ZSH="$HOME/.nix-profile/share/oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR="$HOME/.nix-profile/bin/nvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"

export LESSOPEN="| pygmentize %s 2> /dev/null"
export LESS=' -R '

export FZF_DEFAULT_OPTS='
    --color=fg:#ebdbb2,bg:-1,hl:#fabd2f,gutter:-1
    --color=fg+:#ebdbb2,bg+:#504945,hl+:#fabd2f
    --color=info:#83a598,prompt:#e0cba3,pointer:#83a598
    --color=marker:#87ff00,spinner:#fe8019,header:#665c54
    --marker="+"
    --layout=reverse
    --multi
    --preview "less -R {}"
    --bind "ctrl-v:become(nvim {})"
'
export FZF_ALT_C_OPTS='--preview "tree -C {}"' # cd. Change the preview type
export FZF_CTRL_R_OPTS='--preview-window hidden' # history. Hide preivew window
export FZF_CTRL_T_OPTS='' # files/dirs to cli. Use default preivew
export FZF_COMPLETION_OPTS='' # options for **

# Bind alt-r to open history (ctrl-r will still be avail as the default binding)
zle     -N             fzf-history-widget
bindkey -M emacs '\er' fzf-history-widget
bindkey -M vicmd '\er' fzf-history-widget
bindkey -M viins '\er' fzf-history-widget

#ZSH_THEME="zsh-powerlevel10k/powerlevel10k"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( \
    docker \
    extract \
    fzf \
    git \
    sudo \
    tmux \
)

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.alias ] && source ~/.alias
[ -f ~/.env-variables ] && source ~/.env-variables
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.cargo/env ] && source ~/.cargo/env
[ -f ~/.zsh-hooks ] && source ~/.zsh-hooks

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/nix/store/kxzz9wr10q5r6wzflf90xvdggcfqgjzx-micromamba-1.5.8/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/tBarham/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ -f ~/.p10k.zsh ]; then
  ZLE_RPROMPT_INDENT=0
  source ~/.p10k.zsh
fi

micromamba activate

if [[ $TMUX_PANE ]]; then
    # local tmux_id="$(tmux display -p -F '#{window_index}_#{pane_index}')"
    # HISTFILE=$HOME/.bash_history/tmux_$tmux_id # Fails when ressurecting
    HISTFILE=$HOME/.bash_history/tmux_${TMUX_PANE:1}
fi

[ -f $HOME/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme ] && source $HOME/.nix-profile/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

