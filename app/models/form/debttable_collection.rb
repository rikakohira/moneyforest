class Form::DebttableCollection
  # クラスをモデル化する
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  # 作成したい登録フォームの数を指定
  FORM_COUNT = 10
  # クラス外部からproductsへのアクセスが可能
  attr_accessor :users, :debttables, :list_id, :balance, :debttables_attributes, :form_debttable_collection


  # ハッシュにデータを格納
  def initialize(user = nil, attributes = nil)
    super(attributes)
    @user = user
    self.debttables = FORM_COUNT.times.map { Debttable.new } unless debttables.present?
  end

  def debttables_attributes=(attributes)
    # これで与えられたparamsの値をdebttableのオブジェクトに格納したい
    self.debttables = attributes.map {|_, v| Debttable.new(v)}
  end

  def save
    # transactionでデータベース内の情報の整合性を保つ
    ## balanceとlist_idが存在すれば保存対象の配列に入れる
    debttables = 
      self.debttables.map do |debttable|
        if debttable.balance.present? && debttable.list_id.present?
          debttable.user = @user
          debttable
        end
      end.compact
    Debttable.transaction do
      debttables.map(&:save!)
    end
  rescue StandardError => e
    false
  end
end