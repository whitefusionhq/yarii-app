require "#{Rails.root}/lib/build_jekyll"
class ApplicationContentModel < Yarii::ContentModel
  include YariiEditor::ModelCallbacks
  include YariiEditor::Previewing

  # TODO: move this into a concern
  after_save :rebuild_site
  after_destroy :rebuild_site

  def rebuild_site
    BuildJekyll.now
  end
end
