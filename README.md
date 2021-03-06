# AnimeLists

[![Build Status](https://travis-ci.org/henry0312/AnimeLists.svg?branch=master)](https://travis-ci.org/henry0312/AnimeLists)

新番組の録画設定を楽にするためにアニメの情報を提供します。

我々は最低でも年に4回新番組の設定をしなければならないが、そのリソースを一箇所に集めることが出来ればかなり質の高い情報が作れるのではないかと考え、実験的にプロジェクトを開始しました。

## 免責事項

本プロジェクト及びその協力者（以降まとめて本プロジェクトと呼ぶ）は提供するデータの正確性については一切保証しません。本プロジェクトのデータを用いて生じたあらゆる損害等についても、理由の如何に関わらず、一切責任を負いません。本プロジェクトのデータは自己責任で使用しなければなりません。

## データの閲覧方法

Github Pagesを使って簡易ページを公開しています。

* [アニメリスト](http://henry0312.github.io/AnimeLists/)

また、生データは`data`にjson形式で保持しています。

## 協力方法

たくさんの人のご協力をお待ちしております。また、出来るだけ多くの有志の方々にリポジトリへのPush権限を渡したいと思っています。

### データの更新

`data`にある各データを修正してください。

例えば、`Anime2014Q3.json`は2014年の夏アニメのデータで、`Anime2014Q3C.json`がこの時の継続アニメの情報になります。

### 地域の追加

`data`にチャンネルデータ`channel_*.json`を追加し、`lib/anime_lists.rb`に必要なメソッドを追加してください。

チャンネルデータは[チャンネル一覧](http://cal.syoboi.jp/chlist.php)に従います。

### Webページの更新

[Middleman](http://middlemanapp.com/jp/)を使って静的ページを作成しています。ソースファイルが`source`にありますので、こちらを修正してください。

Middlemanの開発環境は以下のようにして構築します。

```sh
# require Ruby and Bundler
bundle install --path vendor/bundle
```

## データに関して

データは最初に[しょぼいカレンダー](http://cal.syoboi.jp/)をクロールして取得し、その後はそれを更新しています。しょぼいカレンダーについては以下を参照してください。

* [0. しょぼいカレンダーとは - しょぼいカレンダーのヘルプ](https://sites.google.com/site/syobocal/syoboi-calendar-toha)

当然ですが、このプロジェクトが提供しているデータに誤りがあってもしょぼいカレンダーには一切の責任は発生しません。

## TODO

- [x] Travis-CI対応
- [ ] 新番組の対応時期について考える
- [ ] 手間を掛けずに情報をしょぼいカレンダーにフィードバックする方法を考える