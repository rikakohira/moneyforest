class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :age_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
end
