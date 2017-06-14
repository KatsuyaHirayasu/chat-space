require 'rails_helper'

describe Message do
  describe '#create' do
    it "is invalid with a content" do
    message = build(:message)
    message.valid?
    expect(message).to be_valid
    end

    it "is invalid without a content" do
    message = build(:message, content: nil)
    message.valid?
    expect(message.errors[:content]).to include("を入力してください。")
    end
  end
end
