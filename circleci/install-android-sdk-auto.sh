#! /bin/sh
# check env
if test "$ANDROID_HOME" = ""; then
  echo "var NG : ANDROID_HOME"
  exit 1
else
  echo "ANDROID_HOME=$ANDROID_HOME"
fi

echo "#############################################"
echo "#            Setup Env                      #"
echo "#############################################"
export ANDROID_BUILD_TOOLS_VERSION=26.0.1
export ANDROID_TARGET_SDK_VERSION=26

export PATH=${PATH}:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_HOME/tools/bin
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME

# check latest https://developer.android.com/studio/index.html#downloads
DEPENDENCIES_VERSION=20170725
TEMP_INSTALL_PATH=$ANDROID_HOME.tmp
SDK_URL=https://dl.google.com/android/repository/tools_r25.2.5-linux.zip

echo "#############################################"
echo "#    Download Android SDK rev. ${DEPENDENCIES_VERSION} #"
echo "#############################################"
if [ -e "$ANDROID_HOME" ]; then
    echo "Downloaded android sdk"

else
    echo "download android sdk"

    wget -O "$HOME/android-sdk.zip" "$SDK_URL"
    mkdir "/home/ubuntu/android-sdk.tmp"
    unzip -d $ANDROID_HOME $HOME/android-sdk.zip > /dev/null
fi

ls -al ${ANDROID_HOME}
ls -al ${ANDROID_HOME}/licenses
echo "###################################"
echo "#            LICENSE              #"
echo "###################################"
echo ${ANDROID_HOME}/licenses/android-sdk-license
echo ${ANDROID_HOME}/licenses/android-sdk-preview-license

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

echo "###################################"
echo "#    install Licence Files        #"
echo "###################################"
mkdir ${ANDROID_HOME}/licenses
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > ${ANDROID_HOME}/licenses/android-sdk-license
echo "84831b9409646a918e30573bab4c9c91346d8abd" > ${ANDROID_HOME}/licenses/android-sdk-preview-license

echo "###################################"
echo "#        install Tools            #"
echo "###################################"
mkdir ~/.android
touch ~/.android/repositories.cfg
sdkmanager --channel=3 "platform-tools"
sdkmanager --channel=3 "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"
sdkmanager --channel=3 "platforms;android-${ANDROID_TARGET_SDK_VERSION}"
sdkmanager --channel=3 "extras;android;m2repository"
sdkmanager --channel=3 "extras;google;google_play_services"
sdkmanager --channel=3 "extras;google;m2repository"
# all update
sdkmanager --channel=3 --update

# check platform-tools
if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
  echo "command OK : adb"
else
  echo "command NG : adb"
fi
