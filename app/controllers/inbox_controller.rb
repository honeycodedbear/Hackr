class InboxController < ApplicationController

  def index
    @user = User.find params[:id]
    @you = User.find session[:current_user_id]
  end

end
