# TMUX
tms() {
  session=$(tmux list-sessions -F '#{session_name}' 2>/dev/null | fzf) && tmux attach -t "$session"
}

# Only attach if in a terminal (with a valid TTY), not in nested shells
if [[ -t 0 ]] && [[ -n $PS1 ]] && [ -z $TMUX ]; then
  tmux attach -t $(tmux list-sessions -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -rn | head -1 | awk '{print $2}') 2>/dev/null
fi

# Exit tmux popup with Escape
if [[ -n "$TMUX_POPUP_SHELL" ]]; then
  KEYTIMEOUT=1
  _popup_exit() { exit; }
  zle -N _popup_exit
  bindkey '^[' _popup_exit
fi

# Path to your oh-my-zsh installation.
# Install with: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Plugins: git-open, zsh-autosuggestions, zsh-syntax-highlighting must be cloned into $ZSH/custom/plugins/
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  git-open
  npm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Hardcode brew prefix (avoids 38ms `brew --prefix` subprocess call)
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

# Skip compaudit security check (saves ~23ms). Re-enable if you add untrusted fpath dirs.
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# Environment: Android, Unity, AI tokens, locale, secrets
[[ -f "$HOME/.bash_profile" ]] && source "$HOME/.bash_profile"

# FZF
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden"

# Show Hostname in zsh
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# ALIAS
alias tmx="tmux attach -t \$(tmux list-sessions -F '#{session_last_attached} #{session_name}' | sort -rn | head -1 | awk '{print \$2}')"
alias ls="eza -s=ext -l --no-user --group-directories-first"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias python=python3.12
alias pip=pip3.12
alias python3=python3.12
alias pip3=pip3.12
alias llvm-objdump='$ANDROID_NDK_ROOT/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-objdump'
alias yt-480='yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]" -o "$HOME/Downloads/videos/%(title)s.%(ext)s"'

# Alacritty move arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Work aliases (Unity, etc.)
[[ -f "$HOME/.zshrc.work" ]] && source "$HOME/.zshrc.work"

# PATH entries (guarded to avoid clutter if not installed)
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "/opt/homebrew/opt/lsof/bin" ]] && export PATH="/opt/homebrew/opt/lsof/bin:$PATH"
