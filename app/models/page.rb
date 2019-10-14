class Page < ApplicationContentModel
  variables :layout, :date, :title, :subtitle, :cloudinary_id, :permalink

  before_save :strip_layout

  def generate_new_file_path
    slug = if title
      title.gsub(/['|"]/,'').parameterize
    else
      "untitled_#{self.class.name.parameterize}"
    end

    self.class.absolute_path("#{slug}.md")
  end

  def strip_layout
    self.layout = nil if layout and layout.strip == ""
  end
end
