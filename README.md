# About BushouRensou
デプロイ後のサービスは <a href="http://bushourensou.herokuapp.com/" target="_blank">武将連想</a>

＊メモレベルで残しておきます

## Ruby version
ruby 2.3.0 / Rails 5.0.7 で作成

## Twitter認証を使う場合
dotenvを使っています。手順は

1 Twitter Appllication Management で APIキーとAPIシークレットキーを取得

1 .env ファイルをアプリケーションのルートディレクトリに作成し、 TWITTER_APP_ID（APIキー）・TWITTER_APP_SECRET(APIシークレットキー)として各値を設定

## 管理者機能を作る場合
管理者にする人のtwitter UID を 管理者TBLに登録
