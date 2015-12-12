#!/bin/sh

# check env
if test "$ANDROID_HOME" = ""; then
  echo "var NG : ANDROID_HOME"
  exit 1
else
  echo "var OK : ANDROID_HOME"
fi

# check tools
if type -P android > /dev/null; then
  echo "command OK : android"
else
  if type -P android.bat > /dev/null;then
    alias android=android.bat
    echo "alias android=android.bat"
    echo "command OK : android"
  else
    echo "command NG : android"
    exit 1
  fi
fi

# Install Build Tools
echo y | android update sdk -u -a -t "tools"
echo y | android update sdk -u -a -t "platform-tools"
echo y | android update sdk -u -a -t "build-tools-23.0.2"
echo y | android update sdk -u -a -t "build-tools-23.0.1"
echo y | android update sdk -u -a -t "build-tools-23.0.0"
echo y | android update sdk -u -a -t "build-tools-22.0.1"
echo y | android update sdk -u -a -t "build-tools-22.0.0"

# Install Android SDK
echo y | android update sdk -u -a -t "android-23"
echo y | android update sdk -u -a -t "android-22"
echo y | android update sdk -u -a -t "android-21"
echo y | android update sdk -u -a -t "android-20"
echo y | android update sdk -u -a -t "android-19"
echo y | android update sdk -u -a -t "android-18"
echo y | android update sdk -u -a -t "android-17"
echo y | android update sdk -u -a -t "android-16"
echo y | android update sdk -u -a -t "android-15"
echo y | android update sdk -u -a -t "android-14"

# Install Extra Repo
echo y | android update sdk -u -a -t "extra-android-m2repository"
echo y | android update sdk -u -a -t "extra-android-support"
echo y | android update sdk -u -a -t "extra-google-admob_ads_sdk"
echo y | android update sdk -u -a -t "extra-google-gcm"
echo y | android update sdk -u -a -t "extra-google-google_play_services"
echo y | android update sdk -u -a -t "extra-google-m2repository"
echo y | android update sdk -u -a -t "extra-google-play_billing"
echo y | android update sdk -u -a -t "extra-google-play_licensing"

# Update Build Tools
echo y | android update sdk -u -a -t "tools"

# check platform-tools
if type -P adb > /dev/null; then
  echo "command OK : adb"
else
  echo "command NG : adb"
  exit 1
fi
