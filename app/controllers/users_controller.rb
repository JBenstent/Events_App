class UsersController < ApplicationController

  def index
  end

  def logout
    session.clear
    redirect_to "/"
  end

  def createuser
    user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], state: params[:state], password: params[:password])
    if user.valid?
      session[:user_info] = user.first_name
      session[:user_id] = user.id
      session[:user_state] = user.state
      redirect_to "/events/" + session[:user_id].to_s
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/"
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user and user.password == params[:password]
      session[:user_info] = user.first_name
      session[:user_id] = user.id
      session[:user_state] = user.state
      redirect_to "/events/" + session[:user_id].to_s
    else
      flash[:errors] = ['Unsuccessful Login']
      redirect_to "/"
    end
  end


  def edit_user
    @user = User.where(id: params[:id])
  end

  def update_user
   User.update(params[:id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], state: params[:state])
   session[:user_state] = params[:state]
   redirect_to "/events/" + session[:user_id].to_s
  end
end
