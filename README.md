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

## usersテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| nickname | string | null: false |                  
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| age_id | integer | null: false |
| category_id | integer | null: false |


### Association


- has_one :shisan_input
- has_one :fusai_input


## shisan_inputsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| balance | integer | null: false |    


### Association

- belongs_to :user
- has_many :shisan_lists
- has_many :lists , through: :shisan_lists


## fusai_inputsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| balance | integer | null: false |    


### Association

- belongs_to :user
- has_many :fusai_lists
- has_many :lists , through: :fusai_lists


## listsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| group | string | null: false | 
| code | integer | null: false | 
| code_name  | string | null: false | 
| memo  | string |  | 


### Association
- has_many :shisan_lists
- has_many :shisan_inputs, through: :shisan_lists
- has_many :fusai_lists
- has_many :fusain_inputs , through: :fusai_lists






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
