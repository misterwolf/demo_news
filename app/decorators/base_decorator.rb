class BaseDecorator < SimpleDelegator
  def evaluate_format(format)
    if format == :numbers
      '%d-%m-%Y'
    else
      '%d %B %Y'
    end
  end
end
