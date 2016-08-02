#! /bin/sh

install_platform() {
echo "check build-tools-$1"

if [ -e "$ANDROID_HOME/platforms/android-$1" ]; then
  echo "  * Installed SDK $1"
  return
fi

echo y | "$ANDROID_HOME/tools/android" update sdk -u -a -t "android-$1"

}

install_platform "19"
