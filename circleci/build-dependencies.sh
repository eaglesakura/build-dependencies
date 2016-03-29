#! /bin/sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/build-dependencies/master/circleci/invalidate-cache.sh)"

if [ $? -ne 0 ]; then
    echo "Cache Ctrl Failed."
    exit 1
fi

./gradlew dependencies

if [ $? -ne 0 ]; then
    echo "dependencies check Failed."
    exit 1
fi
