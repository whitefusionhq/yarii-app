# This migration comes from yarii_editor (originally 20200420221048)
class AddPreviewBuildCommandToYariiSites < ActiveRecord::Migration[6.0]
  def change
    add_column :yarii_sites, :preview_build_command, :string
  end
end
