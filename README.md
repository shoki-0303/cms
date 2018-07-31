# README

## CMS仕様
usersテーブルでは、admin_flgで管理者と一般ユーザーを分ける。
一般ユーザーは記事の削除と公開を行うことができない。
記事公開の定義はarticlesテーブルのreleaseカラムをtrueとすること。
管理者は一般ユーザーの全てのアクションに加えて、記事の削除と公開、カテゴリーの管理を行う。

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null :false, unique :true|
|email|text|null :false, unique :true|
|password|text|null :false|
|admin_flg|boolean|null :false, default => false|

### Association
- has_many :articles

### description

usersテーブルはdevise gemを用いて実装する。
nameカラムとadmin_flgカラムを追加。
admin_flgのデフォルトをfalseとし、管理者は適宜trueに変更。


## articlesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null :false, index :true|
|image|text|null :false|
|description|text|null :false|
|body|text|null :false|
|release|boolean|null :false, default => false|
|user|references|null :false, foreign_key: true|
|category|references|null :false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category

### description

user_idとcategory_idカラムは、references型で作成。
releaseカラムのデフォルトはfalseとし、管理者のみtrueに変更できる。
記事の検索を行うことを想定し、titleにはindexを貼る。
imageには、carrierwave gemを使用する。

## categorysテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|content|text|null :false|
|image|text|null :false|


### Association
- belongs_to

### description

imageには、carrierwave gemを使用する。
categoryモデルに関する操作を行えるのは、管理者のみ。


