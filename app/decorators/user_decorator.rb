# frozen_string_literal: true

# UserDecorator
# a simple decorator to facilitate User representation
  class UserDecorator < SimpleDelegator
    def full_name
      "#{name} #{lastname}".strip
    end

    def joined_at
      created_at.strftime('%B %Y')
    end
  end
