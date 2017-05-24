class MessagesController < ApplicationController

  before_action :autenticate_user!, except: :index

  def index
  end

end
