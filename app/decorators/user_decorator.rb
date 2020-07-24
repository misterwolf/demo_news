# frozen_string_literal: true

# UserDecorator
# a simple decorator to facilitate User representation
class UserDecorator < BaseDecorator
  def full_name
    "#{name} #{lastname}".strip
  end

  def created(format = :numbers)
    formatting = evaluate_format(format)

    created_at.strftime(formatting)
  end
end
