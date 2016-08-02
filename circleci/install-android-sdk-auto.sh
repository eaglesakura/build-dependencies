#! /bin/sh
# check env
if test "$ANDROID_HOME" = ""; then
  echo "var NG : ANDROID_HOME"
  exit 1
else
  echo "ANDROID_HOME=$ANDROID_HOME"
fi

export PATH=${PATH}:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME

# check latest https://developer.android.com/studio/index.html#downloads
DEPENDENCIES_VERSION=20160802
TEMP_INSTALL_PATH=$ANDROID_HOME.tmp
SDK_URL=https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz

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
install() {
  TOOL_NAME=$1
  CACHE_NAME=$2
  if [ -e "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/${CACHE_NAME}" ]; then
    echo "  * Installed : ${TOOL_NAME} :: ${CACHE_NAME}"
    return
  fi

  echo y | android update sdk -u -a -t "${TOOL_NAME}"
  echo "SUCCESS" > "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/${CACHE_NAME}"
}

install "platform-tools" "platform-tools"
# install "tools" "tools"

# check platform-tools
if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
  echo "command OK : adb"
else
  echo "command NG : adb"
fi
