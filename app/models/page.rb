class Page < ApplicationContentModel
  variables :layout, :date, :published, :title, :subtitle, :cloudinary_id, :alt_cloudinary_id, :cloudinary_ids, :permalink

  def generate_new_file_path
    slug = if title
      title.gsub(/['|"]/,'').parameterize
    else
      "untitled_#{self.class.name.parameterize}"
    end

    self.class.absolute_path("#{slug}.md")
  end
end
