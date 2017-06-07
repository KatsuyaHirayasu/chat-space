class Message < ApplicationRecord
  include ApplicationHelper
  belongs_to :user
  belongs_to :group

  validates :content, presence: true
end
