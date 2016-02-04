#! /bin/sh

REQUEST_SDK_PATH=~/android-sdk-linux
TEMP_INSTALL_PATH=$REQUEST_SDK_PATH.tmp
SDK_URL=https://dl.google.com/android/android-sdk_r22-linux.tgz


echo "###################################"
echo "#    install Android SDK          #"
echo "###################################"
if [ -e "$REQUEST_SDK_PATH" ]; then
    echo "installed android sdk"
else
    wget -O "$TEMP_INSTALL_PATH.tgz" "$SDK_URL"
    tar xovfz "$TEMP_INSTALL_PATH.tgz"
    rm "$TEMP_INSTALL_PATH.tgz"
fi

echo "###################################"
echo "#    update platform tools        #"
echo "###################################"
export ANDROID_HOME=$REQUEST_SDK_PATH
wget -O temp.sh "https://raw.githubusercontent.com/eaglesakura/build-dependencies/master/android-sdk.sh"
chmod 755 temp.sh
source ./temp.sh
