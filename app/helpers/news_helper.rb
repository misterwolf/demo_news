module NewsHelper
  def compare_current_user(user = nil) # used in view
    current_user && current_user == user
  end
end
