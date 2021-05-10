# yonda(よんだ)

yondaは、読後の新鮮な感想を簡単に記録するためのサービスです。
https://yonda-app.herokuapp.com/

# Features

yondaは、読み終わった本に感想コメントなどを加えて情報を登録することができます。
ISBNコードを入力して登録することで、タイトル、著者、書籍名などをワンクリックで登録できます。

投稿一覧(ユーザホーム)では書籍情報とともに、書影も登録されるため、
何をいつ読んだのかが視覚的にわかりやすいです。

ちょっと前に読んだあの本、どんな内容だったけ?
ということが多い私のような人にぜひ使っていただきたいと思っています。

# Requirement

* Ruby version
  3.0.0

* Rails version
  6.1.3

* Bootstrap
  4.2.1

* heroku
  7.50.0


# Installation

-

# Usage

-

# Note

* テストユーザ
  ユーザ名 : User1
  パスワード : password

* 注意点
  ** ISBNコードでの登録は必須ではありませんが、その場合書影は表示されません。

  ** 取得した書籍情報は編集可能です。

  ** 未ログイン状態でも、レビュー検索は可能です。


* 実装しなかった機能
  ** フォロー機能
     他人の読書記録を確認するためのフォロー機能を実装しようと考えたが、
     このアプリケーションの作成意図は、あくまで自分用の読書管理なので
     フォロー機能は実装しないと決めた。


* 今後のアップデートで実装したら面白いと思う機能
  ** 評価機能
     新規投稿の際に、評価をつけることで、該当タイトルの総合評価を表示する。
  
  ** 書籍情報の詳細表示
     ジャンルやページ数、あらすじなどの書籍情報を表示する。
  
  ** おすすめ機能
     投稿した読書傾向からおすすめの一冊を紹介する。

  ** 新刊情報
     投稿済みの作家の新刊情報をお知らせする。

# Author

* Shogo Kondo
* tip.hp67@gmail.com

# License

-