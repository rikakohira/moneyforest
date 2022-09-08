## Moneyforest

家計簿を卒業のための家計管理システムです。
ただ日々の収支を記録するのではなく、「家計の健康状態を確認・将来必要な資産の形成」を目的として開発しました。

## 使用技術

- HTML,CSS
- ruby 2.6.5
- Ruby on Rails 6.0.0
- MySQL 14.14
- heroku
- RSpec

## テスト

- RSpec
  - 単体テスト(model)

## アプリケーションのURL
- 

## テスト用アカウント
- 

# 利用方法

# アプリケーションを作成した背景

# 工夫した点

# 要件定義

# データベース設計

# テーブル設計

# usersテーブル

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


# debitsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| date | date | null: false |
| debit_amount | integer | null: false | 
| memo | text ||
| d_list_id | bigint | null: false, index: true | 



### Association

- has_one :credit
- belongs_to :list


# creditsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| credit_amount | integer | null: false | 
| c_list_id | bigint | null: false, index: true | 
| debit | references | null: false, foreign_key: true | 



### Association

- belongs_to :debit
- belongs_to :list














# 面遷移図

# 開発環境

- フロントエンド
	- HTML, CSS
- バックエンド
	- Ruby on Rails(Ruby), Javascript
- データベース
	- MySQL
- タスク管理
	- Github

# ローカルでの動作方法
