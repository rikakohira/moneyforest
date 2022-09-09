# MoneyForest

**コンセプト** <br>
「家計簿を卒業のための家計管理システム」

ただ日々の収支を記録するのではなく、「家計の健康状態の確認・将来必要な資産の形成」を目的として開発しました。
複式簿記を用いることにより、家計の財務状況を一目で確認することができます。

[![Image from Gyazo](https://i.gyazo.com/a32c831a143d37a8fe6c8dda4d1eded3.jpg)](https://gyazo.com/a32c831a143d37a8fe6c8dda4d1eded3)


# URL

https://moneyforest.herokuapp.com/ <br>
画面右上から新規登録を行うことができます。

- ユーザー名：hirata
- パスワード：Zaq12wsx

# 使用技術

- HTML,CSS
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- JavaScript
	- jQuery
- heroku
- RSpec

# 機能一覧

- ユーザー管理機能(devise)
	- 新規登録機能(JavaScript)
	- ログイン機能
- 帳簿機能
	- 仕分登録機能
	- 月度別仕分検索機能(Ajax)

- 現在開発中の機能
	- 集計機能

# テスト

- RSpec
  - 単体テスト(model)


# データベース設計

[![Image from Gyazo](https://i.gyazo.com/faaa69f65a70eab093adc000448f132b.png)](https://gyazo.com/faaa69f65a70eab093adc000448f132b)

# テーブル設計

## usersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| nickname | string | null: false |                  
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| age_id | integer | null: false |
| category_id | integer | null: false |


### Association


- has_one :assettable
- has_one :debttable
- has_many :debits


## assettablesテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| balance | integer | null: false | 
| user | references | null: false, foreign_key: true |
| list | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :list



## debttablesテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| balance | integer | null: false |  
| user | references | null: false, foreign_key: true |
| list | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :list


## listsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| group | string | null: false | 
| code | integer | null: false | 
| code_name  | string | null: false | 
| memo  | string |  | 


### Association

- has_many :assettables
- has_many :debttables
- has_many :debits
- has_many :credits


## debitsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| date | date | null: false |
| debit_amount | integer | null: false | 
| memo | text ||
| d_list_id | bigint | null: false, index: true | 
| user | references | null: false, foreign_key: true | 


### Association

- has_one :credit
- belongs_to :list
- belongs_to :user



## creditsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| credit_amount | integer | null: false | 
| c_list_id | bigint | null: false, index: true | 
| debit | references | null: false, foreign_key: true | 



### Association

- belongs_to :debit
- belongs_to :list


