# アプリケーション名
Moneyforest


# アプリケーション概要
家計簿卒業のための家計管理アプリケーションです。


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

### Association

- belongs_to :user　
- has_many :asset_lists
- has_many :lists , through: :asset_lists


## debttablesテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| balance | integer | null: false |    
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :debt_lists
- has_many :lists , through: :debt_lists


## listsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| group | string | null: false | 
| code | integer | null: false | 
| code_name  | string | null: false | 
| memo  | string |  | 


### Association
- has_many :asset_lists
- has_many :assettables, through: :asset_lists
- has_many :debt_lists
- has_many :debttables , through: :debt_lists


## asset_lists 中間テーブル
| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| assettable | references | null: false, foreign_key: true |
| list | references | null: false, foreign_key: true |

### Association
- belongs_to :assettable
- belongs_to :list


## debt_lists 中間テーブル
| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| debttable | references | null: false, foreign_key: true |
| list | references | null: false, foreign_key: true |

### Association
- belongs_to :debttable
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
