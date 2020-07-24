# frozen_string_literal: true

# NewsDecorator
# a simple decorator to facilitate News representation
class NewsDecorator < BaseDecorator
  def created(format = :numbers)
    formatting = evaluate_format(format)

    created_at.strftime(formatting)
  end

  def updated(format = :numbers)
    formatting = evaluate_format(format)

    created_at.strftime(formatting)
  end
end
