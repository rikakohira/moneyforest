# MoneyForest

**コンセプト** <br>
「家計簿を卒業のための家計管理システム」

ただ日々の収支を記録するのではなく、「家計の健康状態の確認・将来必要な資産の形成」を目的として開発しました。
複式簿記を用いることにより、家計の財務状況を一目で確認することができます。

**開発の経緯** <br>
ペルソナは同世代(20~30代)の会社員に設定しています。<br>
将来のため、資産形成や投資信託などに興味があるが、そもそも現状の資産額と負債額が把握できていない、いつまでにどの程度お金を準備したらいいかわからない、毎日家計簿に記録するのは大変、といった課題を解決を解決したく、アプリケーションの開発に至りました。

**名前の由来** <br>
「木を見て森を見ず」ということわざがあります。木が家計簿で、森が人生（ライフプラン）だとした時、日々収支を記録するだけの家計簿は、まさに木を見て森を見ていない状況だと思いました。「木を見て森を見通す家計簿」を作りたいと思ったことから、「Money Forest」と命名しました。

[![Image from Gyazo](https://i.gyazo.com/a32c831a143d37a8fe6c8dda4d1eded3.jpg)](https://gyazo.com/a32c831a143d37a8fe6c8dda4d1eded3)

# URL
※保留

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
	- マイページ

- 帳簿機能
	- 仕分登録機能(Formオブジェクト)
	- 編集・削除機能
	- 仕分検索機能(Ajax)

- その他機能
	- 勘定科目一覧リスト
	- 上記の編集機能(activerecord-import)
	
- 現在開発中の機能
	- 集計機能
	- マニュアルの作成
　　　　
# 使い方

**■ ログアウトユーザーのトップページ** <br>
右上の `ログイン` または `アカウント作成` から、ログインすることができます。<br>
新規登録機能は、deviseを用いて、Wizard形式にて実装しました。<br>
入力に不備があった場合はアラートを出し、ユーザーが直感的に操作できる仕様にしました。

[![Image from Gyazo](https://i.gyazo.com/b6c28c6af05cae1b310c370e0b56831f.gif)](https://gyazo.com/b6c28c6af05cae1b310c370e0b56831f)

**■ ログインユーザーのトップページ** <br>
デフォルトで、今月の仕分帳をトップページに表示する仕様です。　<br>
月度別仕分検索機能は、ajax通信を用いて画面遷移なしで、月度別の仕訳帳を表示します。<br>
仕分登録機能は、 `新しい仕分を作成` から仕分入力フォームへ遷移します。　<br>
`編集・削除` ボタンから、仕分けの編集と削除が可能です。

[![Image from Gyazo](https://i.gyazo.com/2313835314845bb42dbeb301a0ec0733.gif)](https://gyazo.com/2313835314845bb42dbeb301a0ec0733)

[![Image from Gyazo](https://i.gyazo.com/ef88b2021f676530135bcf6efebcd079.png)](https://gyazo.com/ef88b2021f676530135bcf6efebcd079)

# 開発にあたって
工夫した点は、2点あります。<br>
1つ目は、ユーザーにとって使いやすいアプリケーションの開発を心がけたことです。　<br>
例えば、ユーザー新規登録機能はWizard形式を用いて、1つのページでの入力数を減らし、入力に不備があった場合、アラートを出すなど、ユーザーが直感的に操作できる仕様にしました。　<br>
2つ目は、複式簿記を家計簿に取り入れたことです。　<br>
仕訳帳を作成することで、 貸借対照表を使い「資産状況を管理」を、 損益計算書で「収支を管理 ・家計の改善点を確認」を行うことができます。具体的に、簿記の知識がなくても簡単に仕分けを行うことができる仕組みを考えました 。また、分析ツールであるためデータが非常に重要だと思い、データベース設計に神経を使いました。　<br>
オリジナルアプリの開発では、自分の力でアプリケーションを作る楽しさと苦悩を感じました。一貫して楽しかったのですが、やはり自分の知識不足により多くのステップでつまずき、自分の技術力とやりたいことの乖離に苦しみました。「どんな課題をどのように解決したいのか」というコンセプトに戻り、考え直し、常にベストな答えを出すことを心がけました。
 
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


