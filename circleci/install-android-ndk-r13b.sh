#! /bin/sh

if test "$ANDROID_NDK_HOME" = ""; then
  echo "var NG : ANDROID_NDK_HOME"
  exit 1
else
  echo "ANDROID_NDK_HOME=$ANDROID_NDK_HOME"
fi

DEPENDENCIES_VERSION="r13b"
SDK_URL="https://dl.google.com/android/repository/android-ndk-$DEPENDENCIES_VERSION-linux-x86_64.zip"

echo "#############################################"
echo "#    Download Android NDK rev. ${DEPENDENCIES_VERSION} #"
echo "#############################################"
if [ -e "$ANDROID_NDK_HOME" ]; then
    echo "Downloaded android ndk"
else
    echo "download android ndk"

    wget -O "/home/ubuntu/android-ndk.zip" "$SDK_URL"
    mkdir "/home/ubuntu/android-ndk.tmp"
    cd "/home/ubuntu/android-ndk.tmp"
    unzip "/home/ubuntu/android-ndk.zip"
    mv "/home/ubuntu/android-ndk.tmp/android-ndk-${DEPENDENCIES_VERSION}" $ANDROID_NDK_HOME
fi

# check platform-tools
if [ -f "$ANDROID_NDK_HOME/ndk-build" ]; then
      echo "command OK : ndk-build"
else
  echo "command NG : ndk-build"
  exit 1
fi

export PATH=$ANDROID_NDK_HOME:$PATH
