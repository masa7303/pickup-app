## サービス概要

![トップページ](https://user-images.githubusercontent.com/50639339/78937645-cfc63c80-7aeb-11ea-851d-ddfd778d7cca.png)

「こうむいんch」を一言でいうと、「公務員が地域のグルメと業務内容について情報交換するためのアプリケーション」です。

公務員として働いていた際、他自治体も同じ業務内容を行なっているにも関わらず、効率的な情報交換が難しいという悩みがありました。

「こうむいんch」は、そうした業務の内容についての悩みを共有できるとともに、他自治体の職員同士がつながることができます。

また地域で働く公務員は、それぞれの地域にある美味しいグルメにも精通しています。

観光誌やテレビなどからは拾えない、ディープな飲食店の情報交換ができる機能も追加しました。


# URL

[https://koumuinch.work/](https://koumuinch.work/)

```HTML
テストユーザーアカウント

メールアドレス：testuser@test.com
パスワード   ：servant
```

※ページ内には「簡単ログイン（テストユーザーとしてワンクリックでログイン可能な機能）」も実装してありますので、お手数であればそちらをご利用ください。
なおテストユーザーは一部機能を制限させていただいておりますので、ご了承ください。


# 開発環境

- Ruby 2.5.1
- Rails 5.2.4


# ER図

![ER図](https://user-images.githubusercontent.com/50639339/78937894-35b2c400-7aec-11ea-875e-be624194de80.png)


# 各種機能＆導入技術

- データベース（MySQL）
- デプロイ（AWS）
- テスト（Rspec、Capybara、factory_bot）
- viewファイル（slim-rails、html2slim、slim）
- CSSフレームワーク（Bootstrap4）
- コードチェック（bullet）
- ユーザー登録＆ログイン（sorcery）
- 画像アップロード（carrierwave）
- レビュー（jquery.raty）
- いいね、ブックマーク（Ajax）
- タグ付け（acts-as-taggable-on）
- ページネーション（kaminari）
- メールアクティベーション（ActionMailer）
- 検索（ransack）
- パンくずリスト（gretel）
- 都道府県データ（jp_prefecture）

**GitHub上では「実装する機能をissueでリストアップ -> branchを切る -> 開発 -> 実装が完了したところでpush -> pull requestを送信する -> merge」といったチーム開発を意識した作業工程で進めました。**


# トップページ

![top](https://user-images.githubusercontent.com/50639339/78939399-03569600-7aef-11ea-8f84-9703bff1e317.png)


# ログインページ

![login](https://user-images.githubusercontent.com/50639339/78939526-46b10480-7aef-11ea-8247-3636f21ba631.png)


# 店舗ページ

![shop](https://user-images.githubusercontent.com/50639339/78939686-91cb1780-7aef-11ea-91bc-f3225c7f1c81.png)
![shop-show](https://user-images.githubusercontent.com/50639339/78939846-d060d200-7aef-11ea-9395-18dd9359121a.png)
![review](https://user-images.githubusercontent.com/50639339/78939939-fd14e980-7aef-11ea-8141-911bfcd11c29.png)


# 業務スレッドページ

![task](https://user-images.githubusercontent.com/50639339/78940001-1cac1200-7af0-11ea-99bc-69913b4785c2.png)
![task-show](https://user-images.githubusercontent.com/50639339/78940070-3a797700-7af0-11ea-946e-a79b95ce4794.png)


# ユーザー一覧・詳細ページ

![user](https://user-images.githubusercontent.com/50639339/78940133-51b86480-7af0-11ea-8c6a-994f6097e261.png)
![user-show](https://user-images.githubusercontent.com/50639339/78940251-81676c80-7af0-11ea-9d3d-fb677ee5e55d.png)

# マイページ

![mypage](https://user-images.githubusercontent.com/50639339/78940277-8c220180-7af0-11ea-8cda-690c63a2b159.png)
