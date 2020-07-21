# frozen_string_literal: true

# News Model
# Keep data about the news
class News < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
end
