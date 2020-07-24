# frozen_string_literal: true

# News Model
# Keep data about the news
class News < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, :content, presence: true

  # Some useful scopes for the future.
  scope :filter_by_title, ->(title) { where('title like ?', "%#{title}%") }
  scope :filter_by_content, ->(content) { where('content like ?', "%#{content}%") }
  scope :filter_by_author, lambda { |author, sort = 'asc'|
    joins(:author).where('users.name like ? OR users.lastname LIKE ?', "%#{author}%", "%#{author}%").
    order("created_at #{sort}")
  }

  # for the future, search in one shot:
  scope :filter_on_author_content_title, lambda { |field|
    joins(:author)
      .where(
               'title like :search OR
               content like :search OR users.name like :search
               OR users.lastname LIKE :search',
               search: "%#{field}%"
            )
  }

  def self.search(value = '')
    filter_on_author_content_title(value)
  end
end
