#! /bin/sh

# Install Android SDK
echo y | android update sdk --no-ui --filter "android-23"
echo y | android update sdk --no-ui --filter "android-22"
echo y | android update sdk --no-ui --filter "android-21"
echo y | android update sdk --no-ui --filter "android-20"
echo y | android update sdk --no-ui --filter "android-19"
echo y | android update sdk --no-ui --filter "android-18"
echo y | android update sdk --no-ui --filter "android-17"
echo y | android update sdk --no-ui --filter "android-16"

# Install Build Tools
echo y | android update sdk --no-ui --filter "tools"
echo y | android update sdk --no-ui --filter "platform-tools"
echo y | android update sdk --no-ui --filter "build-tools-23.0.2"
echo y | android update sdk --no-ui --filter "build-tools-23.0.1"
echo y | android update sdk --no-ui --filter "build-tools-23.0.0"
echo y | android update sdk --no-ui --filter "build-tools-22.0.1"
echo y | android update sdk --no-ui --filter "build-tools-22.0.0"

# Install Extra Repo
echo y | android update sdk --no-ui --filter "extra-android-m2repository"
echo y | android update sdk --no-ui --filter "extra-android-support"
echo y | android update sdk --no-ui --filter "extra-google-admob_ads_sdk"
echo y | android update sdk --no-ui --filter "extra-google-gcm"
echo y | android update sdk --no-ui --filter "extra-google-google_play_services"
echo y | android update sdk --no-ui --filter "extra-google-m2repository"
echo y | android update sdk --no-ui --filter "extra-google-play_billing"
echo y | android update sdk --no-ui --filter "extra-google-play_licensing"
