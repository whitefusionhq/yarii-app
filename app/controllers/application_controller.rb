class ApplicationController < ActionController::Base
  before_action :require_login, except: [:not_authenticated]

  protected

  def not_authenticated
    redirect_to "/signin", alert: 'Please login first.'
  end
end
