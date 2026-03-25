# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Only attach if in a terminal, not in nested shells
if [[ -n $PS1 ]] && [ -z $TMUX ]; then
    tmux attach || tmux new -s main
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	git-open
	npm
	zsh-autosuggestions
	zsh-syntax-highlighting
)


# Enable autocompletions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh
source $HOME/.profile
source $HOME/.bash_profile

# Show Hostname in zsh
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# ALIAS
alias ls="eza -s=ext -l --no-user --group-directories-first"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias python=python3.12
alias pip=pip3.12
alias python3=python3.12
alias pip3=pip3.12
alias llvm-objdump="~/Library/Android/sdk/ndk/27.1.12297006/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-objdump"
alias zipalign="/Users/manuel.gil/Library/Android/sdk/build-tools/35.0.0-rc3/zipalign"

# Unity alias
alias build_android="./jam AndroidPlayer64IL2CPP Editor -sCONFIG=release"
alias build_android_and_run="build_android && ./run"
alias check_if_gradle_version_was_bumped="./jam AndroidPlayer64IL2CPP -sCONFIG=release && ./jam Editor && perl utr.pl --suite='editor' --clean-library --category='RequirePlatformSupport' --setup-platform='android' --category='RequirePlatformSupport' --projectlist='Tests/EditModeAndPlayModeTests/projectlist-withandroidplayers-editor.txt' --testfilter='Tests\.AndroidGradleTemplateTests\.CheckIfGradleTemplateVersionWasBumped' --testproject='PlatformDependent/AndroidPlayer/Tests/EditorTests'"


# Exit tmux popup with Escape
if [[ -n "$TMUX_POPUP_SHELL" ]]; then
  KEYTIMEOUT=1
  _popup_exit() { exit; }
  zle -N _popup_exit
  bindkey '^[' _popup_exit
fi

# Alacritty move arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# opencode
export PATH=/Users/manuel.gil/.opencode/bin:$PATH

