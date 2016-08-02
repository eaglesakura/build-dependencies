#! /bin/sh

# Extra repositoryが更新された場合、キャッシュをcleanして再度同期することで最新版を入れることができる。
DEPENDENCIES_VERSION=20160802
mkdir $ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}
ls -al $ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}

install() {
  TOOL_NAME=$1
  CACHE_NAME=$2
  if [ -e "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/${CACHE_NAME}" ]; then
    echo "  * Installed : ${TOOL_NAME} :: ${CACHE_NAME}"
    return
  fi

  echo y | "$ANDROID_HOME/tools/android" update sdk -u -a -t "${TOOL_NAME}"
  echo "SUCCESS" > "$ANDROID_HOME/.installed-${DEPENDENCIES_VERSION}/${CACHE_NAME}"
}

echo "###################################"
echo "#    install extra repository     #"
echo "###################################"
install "extra-android-m2repository" "extra-android-m2repository"
install "extra-google-m2repository" "extra-google-m2repository"
