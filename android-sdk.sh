#!/bin/sh

# check env
if test "$ANDROID_HOME" = ""; then
  echo "var NG : ANDROID_HOME"
  exit 1
else
  echo "ANDROID_HOME=$ANDROID_HOME"
fi


if [ -e "$ANDROID_HOME/tools/android" ]; then
  echo "android command exist"
  alias android="$ANDROID_HOME/tools/android"
else
  if [ -e "$ANDROID_HOME/tools/android.bat" ]; then
    echo "android.bat command exist"
    alias android="$ANDROID_HOME/tools/android.bat"
  else
    echo "android command not found..."
    exit 1
  fi
fi

# Install build tools
install_build_tools() {

echo "check build-tools-$1"

if [ -e "$ANDROID_HOME/build-tools/$1" ]; then
  echo "  * installed build-tools-$1"
  return
fi

echo y | android update sdk -u -a -t "build-tools-$1"

}

# Install platform
install_platform() {
echo "check build-tools-$1"

if [ -e "$ANDROID_HOME/platforms/android-$1" ]; then
  echo "  * installed SDK $1"
  return
fi

echo y | android update sdk -u -a -t "android-$1"

}

echo "###################################"
echo "#    install platform tools       #"
echo "###################################"
echo y | android update sdk -u -a -t "tools"
echo y | android update sdk -u -a -t "platform-tools"

echo "###################################"
echo "#    install build tools          #"
echo "###################################"
# New build-tools
install_build_tools "24"
install_build_tools "23.0.3"
# Old build-tools
# install_build_tools "22.0.1"

echo "###################################"
echo "#    install platform sdk         #"
echo "###################################"
# Android N
install_platform "24"
# Android 6.0
install_platform "23"
# Android 5.1
install_platform "22"
# Android 5.0
install_platform "21"
# Android Wear
install_platform "20"
# Android 4.4
install_platform "19"
# Android 4.3
install_platform "18"
# Android 4.2
install_platform "17"
# Android 4.1
install_platform "16"
# Android 4.0.3
install_platform "15"

echo "###################################"
echo "#    install extra repository     #"
echo "###################################"
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
if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
      echo "command OK : adb"
else
  echo "command NG : adb"
  exit 1
fi
