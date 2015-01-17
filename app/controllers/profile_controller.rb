class ProfileController < ApplicationController

def index
  #@user = User.find session[:current_user_id]
  @user = User.find params[:id]
end

end
