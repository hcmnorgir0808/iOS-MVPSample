# iOS-MVPSample
swiftで書いたMVPのサンプルアプリです。

QiitaのユーザIDで検索すると、そのユーザが投稿した記事のタイトルを表示します。(最大上位10件)

![画面収録-2020-04-20-1 17 09](https://user-images.githubusercontent.com/48383852/79693592-78239000-82a6-11ea-8ddf-2f52e09367f3.gif)

# MVPの各コンポーネントの役割
## Model
- Presenterからのみアクセスされ、Viewとは直接の関わりをもたない。

## View
- Presenterからの描画指示に従うだけで、完全な受け身な立ち位置。

## Presenter
- すべてのプレゼンテーションロジックを受け持つ

# 参考文献
[iOSアプリ設計パターン入門](https://peaks.cc/books/iOS_architecture)
