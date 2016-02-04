# build-dependencies

## Androidツール導入

 * 下記のコマンドをターミナルから実行することで、自動的にAndroidアプリのビルドに必要なツール等をダウンロードします
 * 動作確認環境
    * Mac
    * Ubuntu
    * Windows(Cygwin)
 * 必要に応じて古いTools等も取得します
 * 事前にAndroid SDKを導入し、環境変数ANDROID_HOMEを設定済みである必要があります
 * 全ての依存を再取得するため、実行には時間がかかります

<pre>
sh -c "$(curl -fsSL https://raw.githubusercontent.com/eaglesakura/build-dependencies/master/android-sdk.sh)"
</pre>
