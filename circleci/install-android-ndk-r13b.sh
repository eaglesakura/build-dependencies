#! /bin/sh

if test "$ANDROID_NDK_HOME" = ""; then
  echo "var NG : ANDROID_NDK_HOME"
  exit 1
else
  echo "ANDROID_NDK_HOME=$ANDROID_NDK_HOME"
fi

SDK_URL=https://dl.google.com/android/repository/android-ndk-r13b-linux-x86_64.zip
echo "#############################################"
echo "#    Download Android SDK rev. ${DEPENDENCIES_VERSION} #"
echo "#############################################"
if [ -e "$ANDROID_NDK_HOME" ]; then
    echo "Downloaded android ndk"
else
    echo "download android ndk"

    wget -O "/home/ubuntu/android-ndk.zip" "$SDK_URL"
    mkdir "/home/ubuntu/android-ndk.tmp"
    cd "/home/ubuntu/android-ndk.tmp"
    unzip "/home/ubuntu/android-ndk.zip"
    mv /home/ubuntu/android-ndk.tmp $ANDROID_NDK_HOME
fi
