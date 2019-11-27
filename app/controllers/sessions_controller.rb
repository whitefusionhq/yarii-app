# app/controllers/user_sessions_controller.rb
 class SessionsController < ApplicationController
   def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to('/')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to('/')
  end
end
