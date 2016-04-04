#! /bin/sh

git clone git@github.com:eaglesakura/maven.git

if [ $? -ne 0 ]; then
    echo "maven clone Failed."
    exit 1
fi

./gradlew dependencies > dependencies.txt
./gradlew clean assemble jar groovydoc uploadArchives uploadGroovydoc

if [ $? -ne 0 ]; then
    echo "Build Failed."
    exit 1
fi


# gitユーザ設定
git config --global user.email 'eagle.sakura+deploy@gmail.com'
git config --global user.name 'eaglesakura-deploy'

if [ -e ./maven ]; then
    echo "maven directory found. commit -> maven $CIRCLE_PROJECT_REPONAME $CIRCLE_BRANCH"
else
    echo "maven directory notfound..."
    exit 1
fi

cd maven
date > .cache_ctrl
git add .
git commit -am "[Circle-CI] add $CIRCLE_PROJECT_REPONAME $CIRCLE_BRANCH.$CIRCLE_BUILD_NUM"
git push origin gh-pages

if [ $? -ne 0 ]; then
    echo "maven push Failed."
    exit 1
fi
