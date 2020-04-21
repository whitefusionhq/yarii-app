class Page < ApplicationContentModel
  variables :title,
	    :subtitle,
	    :layout,
	    :published,
	    :date,
	    :permalink,
	    :tags

  def generate_new_file_path
    slug = if title
      title.gsub(/['|"]/,'').parameterize
    else
      "untitled_#{self.class.name.parameterize}"
    end

    self.class.absolute_path("#{slug}.md")
  end
end
