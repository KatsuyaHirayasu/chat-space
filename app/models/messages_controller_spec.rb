require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message, group_id: group.id, user_id: user.id ) }

  before do
    sign_in user
  end

  before do
    sign_out user
  end

  describe 'GET #index' do
    before do
      get :index, group_id: group.id
    end

    it "renders the :index template" do
      render_template :index
    end
  end

  describe 'POST #create' do
    it "save a new message in the database" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message)
        }.to change(Message, :count).by(0)
    end

    it "can't save a new message in the database" do
      expect{
        post :create, group_id: group.id, message: attributes_for(:message, content: nil)
      }.to_not change(Message, :count)
    end
  end
end


