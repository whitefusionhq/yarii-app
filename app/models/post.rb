class Post < ApplicationContentModel
  folder '_posts'

  variables :layout,
            :date,
            :published,
            :category,
            :title,
            :subtitle,
            :cloudinary_id,
            :tags

  before_save :find_hashtags

  def find_hashtags
    hashtags = content.
      scan(/(^|\s|\>)#([a-z\d-]+)/i).
      map{|item| item[1]}.
      join(' ')
    self.tags = hashtags
  end

  def generate_new_file_path
    if use_date = date && date.to_datetime
      date_prefix = "#{use_date.strftime('%Y-%m-%d')}-"
    else
      date_prefix = "#{Date.current.strftime('%Y-%m-%d')}-"
    end

    slug = if title
      title.gsub(/['|"]/,'').parameterize
    else
      "untitled_#{self.class.name.parameterize}"
    end

    year = date_prefix.split('-').first

    self.class.absolute_path("#{date_prefix}#{slug}.md")
  end
end
