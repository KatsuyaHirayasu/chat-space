class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :massages
  has_many :users, through: :group_users
  has_many :group_users, dependent: :destroy
end
