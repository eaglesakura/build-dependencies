#! /bin/sh
./gradlew dependencies > dependencies.txt
./gradlew clean build groovydoc uploadArchives uploadGroovydoc

if [ $? -ne 0 ]; then
    echo "Build Failed."
    exit 1
fi

