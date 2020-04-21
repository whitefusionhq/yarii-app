load "#{YariiEditor::Engine.root}/app/controllers/yarii_editor/application_controller.rb"

YariiEditor::ApplicationController.class_eval do
  def handle_yarii_authorization_failure
    redirect_to '/signin', alert: 'Please sign in to access the Yarii dashboard'
  end

#  def render_engine_stylesheet_tag
#    render layout: nil
#  end
end
