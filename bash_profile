export UNITY_TRUNK="/opt/UnitySrc/unity-trunk"
export ANDROID_HOME="$UNITY_TRUNK/artifacts/Android SDK"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_ROOT="$UNITY_TRUNK/artifacts/Android NDK"
if [ -d "$ANDROID_SDK_ROOT/cmdline-tools/latest" ]; then
  ANDROID_CMDLINE="$ANDROID_SDK_ROOT/cmdline-tools/latest"
else
  ANDROID_CMDLINE=$(printf '%s\n' "$ANDROID_SDK_ROOT"/cmdline-tools/*/ 2>/dev/null | sort -V | tail -n 1)
fi
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_CMDLINE/bin"

export XDG_CONFIG_HOME=$HOME/.config
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/.scripts"

# AI
export JIRA_AUTH_TOKEN="REMOVED_TOKEN"
google_auth_token() { gcloud auth print-access-token 2>/dev/null; }

# Added by Antigravity CLI installer
export PATH="/Users/manuel.gil/.local/bin:$PATH"
export JAVA_HOME=/Users/manuel.gil/Library/Java/JavaVirtualMachines/jbr-17.0.7/Contents/Home
