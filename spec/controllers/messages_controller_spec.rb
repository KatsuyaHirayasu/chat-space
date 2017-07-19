require 'rails_helper'

describe MessagesController do
  let(:user){ create(:user) }
  let(:group){ create(:group) }
  let(:message){ create(:message, group_id: group, user_id: user ) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    before do
      get :index, group_id: group
    end

    it "renders the :index template" do
      render_template :index
    end
  end

  describe 'POST #create' do
    context 'if message will save' do
      it "save a new message in the database" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message)
          }.to change(Message, :count).by(1)
      end
      it "renders the :index " do
        redirect_to group_messages_path(:group)
      end
    end
    context 'if message will not save' do
      it "can't save a new message in the database" do
        expect{
          post :create, group_id: group.id, message: attributes_for(:message, content: nil)
        }.to_not change(Message, :count)
      end
      it "renders the :index template" do
        render_template :index
      end
    end
  end
end
