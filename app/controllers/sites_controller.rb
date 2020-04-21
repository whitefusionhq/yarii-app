class SitesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    if User.count == 0
      @user = User.new
    else
      require_login
    end

    @site = Yarii::Site.new
  end

  def create
    unless User.count == 0
      require_login
    end

    unless params[:yarii_site][:content_base_path].starts_with?("/")
      params[:yarii_site][:content_base_path] = File.join(
        params[:yarii_site][:git_repo_path],
        params[:yarii_site][:content_base_path]
      )
    end

    @site = Yarii::Site.new(secure_site_params)
    if @site.valid?
      @site.save
      if User.count == 0
        @user = User.create(secure_user_params)
      end

      redirect_to "/"
    else
      flash.now[:error] = "Whoops! Please double-check you filled out all fields correctly."
      render action: "new"
    end
  end

  protected

  def secure_site_params
    params.require(:yarii_site).permit(:title, :preview_base_url, :published_base_url, :content_base_path, :git_repo_path, :preview_build_command)
  end

  def secure_user_params
    params.require(:user).permit(:user, :email, :password)
  end
end