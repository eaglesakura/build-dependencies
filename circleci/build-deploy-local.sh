#! /bin/sh
./gradlew dependencies > dependencies.txt
./gradlew clean build javadoc uploadArchives uploadJavadoc

if [ $? -ne 0 ]; then
    cp -r ./build/reports/ "$CIRCLE_ARTIFACTS"
    cp -r ./build/outputs/ "$CIRCLE_ARTIFACTS"
    echo "Build Failed."
    exit 1
fi
