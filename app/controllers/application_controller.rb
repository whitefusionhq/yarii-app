require "cloudinary"
require "#{Rails.root}/lib/setup_current_user"

class ApplicationController < ActionController::Base
end

YariiEditor::ApplicationController.class_eval do
  rescue_from YariiEditor::NotAuthorizedError do
    flash[:alert] = "Please log in to use Yari"
    redirect_to '/'
  end
end
