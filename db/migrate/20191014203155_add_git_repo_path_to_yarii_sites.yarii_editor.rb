# This migration comes from yarii_editor (originally 20191014203116)
class AddGitRepoPathToYariiSites < ActiveRecord::Migration[6.0]
  def change
    add_column :yarii_sites, :git_repo_path, :string
  end
end
