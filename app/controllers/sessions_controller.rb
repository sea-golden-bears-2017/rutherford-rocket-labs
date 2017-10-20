class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to orders_path
      else
        @errors = ['Invalid combination of username/password.']
        render :new
      end
    else
      @errors = ['Invalid combination of username/password.']
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
