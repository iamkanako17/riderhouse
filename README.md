# アプリ名
Riderhouse Book

## 概要
全国のバイクで旅をするライダーのために、宿を探しやすくするサイト。

## 制作背景
私自身、バイクで北海道へ１０日間のツーリングをした時、ライダーは多いもののそのようない人たちが宿泊する「ライダーハウス」を検索するサイトがなく、宿泊先を探すのにとても苦労したという経験から、一覧で閲覧できて検索できるサイトを作成したら利用者にとっても、宿泊先のホストにとっても良いのではと思い、今回このサイトを制作しようと考えました。

## DEMO
![riderhouse](https://i.gyazo.com/635715312eb99a08ed97aa0d30925439.gif)

## URL
https://riderhouse-book.herokuapp.com/

## 投稿ユーザー
- username: かおり
- mail: kaori@kaori.jp
- pass: kaokao11

## 実装予定の内容
- google calender APIの実装
- 予約機能の実装
- 詳細ページに、宿情報に関する項目の追加
- BootStrapを使用し、ビューの見やすさを向上させる

  # database
  ## host_users table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | nickname       | string       | null: false                     |
  | email          | string       | null: false, unique: true       |
  | password       | string       | null: false                     |
  | phone          | string       | null: false                     |
  | hostname       | string       | null: false                     |
  | hostname_kana  | string       | null: false                     |
  | age            | integer      | null: false                     |
  | gender         | integer      | null: false                     |
  | inn_description_id   | integer      | null: false, foreign_key: true  |

  ### association
  - has_many: inn_description

  ## lodgings table
  | Column            |     Type     |        Options                  |
  | ----------------- | ------------ | ------------------------------- |
  | lodge_name        | string       | null: false                     |
  | price             | string       | null: false                     |
  | postcode          | string       | null: false                     |
  | prefecture_city   | integer      | null: false                     |
  | block_number      | string       | null: false                     |
  | building          | string       |                                 |
  | host_user_id      | integer      | null: false                     |

  ### association
  - belongs_to: host_user


  ## reservations table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | guest_user_id  | integer      | null: false                     |
  | host_user_id   | integer      | null: false                     |

  ### association
  - belongs_to: guest_user
  - belongs_to: host_user


## version
  - ruby 2.6.5
  - rails 6.0.3.2

## How to work locally
  - % git clone <coppied url from GitHub>
  - add to gem file, gem 'pry-rails'
  - bundle install
  - % rails db:create
  - % rails db:migrate
  - % rails s














