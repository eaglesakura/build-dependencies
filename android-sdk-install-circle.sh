#! /bin/sh
# check env
if test "$ANDROID_HOME" = ""; then
  echo "var NG : ANDROID_HOME"
  exit 1
else
  echo "ANDROID_HOME=$ANDROID_HOME"
fi

DEPENDENCIES_VERSION=20160320
TEMP_INSTALL_PATH=$ANDROID_HOME.tmp
SDK_URL=https://dl.google.com/android/android-sdk_r22-linux.tgz

echo "#############################################"
echo "#    Download Android SDK rev. ${DEPENDENCIES_VERSION} #"
echo "#############################################"
if [ -e "$ANDROID_HOME" ]; then
    echo "Downloaded android sdk"

else
    echo "download android sdk"

    wget -O "/home/ubuntu/android-sdk.tgz" "$SDK_URL"
    mkdir "/home/ubuntu/android-sdk.tmp"
    tar xovfz "/home/ubuntu/android-sdk.tgz" -C "/home/ubuntu/android-sdk.tmp"
    mv /home/ubuntu/android-sdk.tmp/android-sdk-linux $ANDROID_HOME
fi

ls -al ${ANDROID_HOME}

echo "###################################"
echo "#    Install Android SDK          #"
echo "###################################"

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

mkdir $ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}
ls -al $ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}

install() {
  if [ -e "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/$1" ]; then
    echo "  * Installed : $1"
    return
  fi

  echo y | android update sdk -u -a -t "$1"
  echo "SUCCESS" > "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/$1"
}

echo "###################################"
echo "#    install platform tools       #"
echo "###################################"
install "tools"
install "platform-tools"

echo "###################################"
echo "#    install build tools          #"
echo "###################################"
install "build-tools-23.0.2"

echo "###################################"
echo "#    install platform sdk         #"
echo "###################################"
# Android 6.0
install "android-23"
# Android 5.1
install "android-22"
# Android 5.0
install "android-21"
# Android Wear
install "android-20"
# Android 4.4
install "android-19"
# Android 4.3
install "android-18"
# Android 4.2
install "android-17"
# Android 4.1
install "android-16"
# Android 4.0.3
install "android-15"

echo "###################################"
echo "#    install extra repository     #"
echo "###################################"
install "extra-android-m2repository"
install "extra-google-m2repository"

# check platform-tools
if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
      echo "command OK : adb"
else
  echo "command NG : adb"
  exit 1
fi
