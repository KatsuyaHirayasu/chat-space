class Group < ApplicationRecord
  has_many :group_users
  has_many :messages
  has_many :users, through: :group_users

  validates :name, presence: true

  def latest_message
    messages.last.try(:content) || 'メッセージなし'
  end
end
