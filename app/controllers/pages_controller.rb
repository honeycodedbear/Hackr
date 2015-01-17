class PagesController < ApplicationController
  def index
  end
  def create_user
    user = User.create email: params[:email], password: params[:password], password_confirmation: params[:password]
    unless user
      redirect_to :signup
    else
      redirect_to :root
    end
  end
  def sign_up
    render :signup
  end
  def sign_in
    search_symbol = if User.isAnEmail?(params[:email]) then "email".to_sym else "name".to_sym end
    user = User.find_by(search_symbol => params[:email].strip.downcase).try(:authenticate, params[:password])
    if user
      session[:current_user_id] = user.id
      @current_user = User.find(session[:current_user_id])
    end
    render :index
  end
end
