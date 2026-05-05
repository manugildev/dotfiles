export UNITY_TRUNK="/opt/UnitySrc/unity-trunk"
export ANDROID_HOME="$UNITY_TRUNK/External/NonRedistributable/Android sdk/builds"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_ROOT="$UNITY_TRUNK/External/NonRedistributable/Android ndk/builds"
if [ -d "$ANDROID_SDK_ROOT/cmdline-tools/latest" ]; then
  ANDROID_CMDLINE="$ANDROID_SDK_ROOT/cmdline-tools/latest"
else
  ANDROID_CMDLINE=$(ls -d "$ANDROID_SDK_ROOT"/cmdline-tools/*/ 2>/dev/null | sort -V | tail -n 1)
fi
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_CMDLINE/bin"

export XDG_CONFIG_HOME=$HOME/.config
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:$HOME/.scripts"

# AI
export ANTHROPIC_BASE_URL=https://uai-litellm.internal.unity.com
export ANTHROPIC_AUTH_TOKEN=sk-3LpWQubW7DeKvnyIVrUyBA
export JIRA_AUTH_TOKEN="AVeIlhdQ7E3mtwUXvw0YyHNeIkuC6e8WXNIm4b"
google_auth_token() { gcloud auth print-access-token 2>/dev/null; }
