class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if Yarii::Site.count == 0
      redirect_to new_site_path
      return
    end

    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password], params[:remember])
        format.html { redirect_back_or_to('/', notice: 'Login successfull.') }
        format.xml { render xml: @user, status: :created, location: @user }
      else
        format.html { flash.now[:error] = 'User account not found. Try again?'; render action: 'new' }
        format.xml { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to('/', notice: 'Logged out!')
  end
end
