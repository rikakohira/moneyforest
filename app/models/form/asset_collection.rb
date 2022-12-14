class Form::AssetCollection
  # クラスをモデル化する
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  # 作成したい登録フォームの数を指定
  FORM_COUNT = 6
  attr_accessor :users, :assettables, :list_id, :balance, :assettables_attributes, :form_assettable_collection

  # ハッシュにデータを格納
  def initialize(user = nil, attributes = nil)
    super(attributes)
    @user = user
    self.assettables = FORM_COUNT.times.map { Assettable.new } unless assettables.present?
  end

  def assettables_attributes=(attributes)
    # paramsの値をAssettableのオブジェクトに格納
    self.assettables = attributes.map { |_, v| Assettable.new(v) }
  end

  def save
    # balanceとlist_idが存在すれば保存対象の配列に入れる
    assettables =
      self.assettables.map do |assettable|
        if assettable.balance.present? && assettable.list_id.present?
          assettable.user = @user
          assettable
        end
      end.compact
    Assettable.transaction do
      assettables.map(&:save!)
    end
  rescue StandardError => e
    false
  end
end
