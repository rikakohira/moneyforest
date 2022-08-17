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

- has_many :records


## recordsテーブル

| Column                | Type         | Options                   |
| --------------------- | ------------ | ------------------------- |
| money | integer | null: false |                    
| account_id | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user


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
