export UNITY_TRUNK="/opt/UnitySrc/unity-trunk"
export ANDROID_HOME="$UNITY_TRUNK/artifacts/Android SDK"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_ROOT="$UNITY_TRUNK/artifacts/Android NDK"
if [ -d "$ANDROID_SDK_ROOT/cmdline-tools/latest" ]; then
  ANDROID_CMDLINE="$ANDROID_SDK_ROOT/cmdline-tools/latest"
else
  ANDROID_CMDLINE=$(find "$ANDROID_SDK_ROOT/cmdline-tools" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort -V | tail -n 1)
fi
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_CMDLINE/bin"

export XDG_CONFIG_HOME=$HOME/.config
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/.scripts"

# Secrets (JIRA_AUTH_TOKEN, etc.) live in an untracked file
[ -f "$HOME/.secrets" ] && . "$HOME/.secrets"

# AI
google_auth_token() { gcloud auth print-access-token 2>/dev/null; }
# https://code.claude.com/docs/en/auto-mode-classifier-billing
export CLAUDE_CODE_AUTO_MODE_SERVER=0
export ANTHROPIC_DEFAULT_MODEL=sonnet
