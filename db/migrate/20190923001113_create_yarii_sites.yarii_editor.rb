# This migration comes from yarii_editor (originally 20190923000809)
class CreateYariiSites < ActiveRecord::Migration[6.0]
  def change
    create_table :yarii_sites do |t|
      t.string :title
      t.string :preview_base_url
      t.string :published_base_url
      t.string :content_base_path

      t.timestamps
    end
  end
end
