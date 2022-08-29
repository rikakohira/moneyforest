class Form::AssetCollection
  #クラスをモデル化する
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  def value_to_boolean(value) ここの記述必要？
    ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)
  end

  #作成したい登録フォームの数を指定
  FORM_COUNT = 3
  #クラス外部からproductsへのアクセスが可能
  attr_accessor :users
  attr_accessor :assettables


  #ハッシュにデータを格納
  def initialize(attributes = {})
    super attributes
    #mapは返り値で配列を作る
    self.assettables = FORM_COUNT.times.map { Assettable.new() } unless self.assettables.present?
  end

  #コントローラからストロングパラメータを受け取る
  def assettables_attributes=(attributes)
    self.assettables = attributes.map { |_, v| Assettable.new(v) }
  end

  def save
    #transactionでデータベース内の情報の整合性を保つ
    Assettable.transaction do
      self.assettables.map do |assettable|
        #チェックボックスにチェックを入れている商品のみが保存される
        if assettable.availability 
          assettable.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end