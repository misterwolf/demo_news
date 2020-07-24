module NewsHelper
  def user_is_owner
    current_user && current_user == News.find_by(id: params[:id]).author
  end

  def compare_current_user(user)
    current_user && current_user == user
  end

  def require_permission
    redirect_to root_path unless user_is_owner
  end
end
