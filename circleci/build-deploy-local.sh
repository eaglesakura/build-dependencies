#! /bin/sh
./gradlew dependencies > dependencies.txt
./gradlew clean build javadoc uploadArchives uploadJavadoc

if [ $? -ne 0 ]; then
    echo "Build Failed."
    cp -r ./build/reports/ "$CIRCLE_ARTIFACTS"
    cp -r ./build/outputs/ "$CIRCLE_ARTIFACTS"
    exit 1
fi
