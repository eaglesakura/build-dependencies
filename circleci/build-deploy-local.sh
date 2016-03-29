#! /bin/sh
./gradlew dependencies > dependencies.txt
./gradlew clean build javadoc uploadArchives uploadJavadoc

if [ $? -ne 0 ]; then
    echo "Build Failed."
    exit 1
fi

