# frozen_string_literal: true

# NewsDecorator
# a simple decorator to facilitate News representation
class NewsDecorator < SimpleDelegator
  def created(format = :numbers)
    formatting = evaluate_format(format)

    created_at.strftime(formatting)
  end

  def updated(format = :numbers)
    formatting = evaluate_format(format)

    created_at.strftime(formatting)
  end

  private

  def evaluate_format(format)
    if format == :numbers
      '%d-%m-%Y'
    else
      '%d %B %Y'
    end
  end
end
