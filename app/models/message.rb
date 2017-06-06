class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :content, presence: true
  def times
    created_at.to_s(:default)
  end
end
