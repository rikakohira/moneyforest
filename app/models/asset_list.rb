class AssetList < ApplicationRecord
  belongs_to :assettable
  belongs_to :list
end
