# Execute following line to create an emulator
#/Applications/android-sdk/tools/android create avd -n emu -t 1

# Run emulator
/Applications/android-sdk/tools/emulator -avd emu &

# Watch TTY
/Applications/android-sdk/platform-tools/adb logcat *:V
