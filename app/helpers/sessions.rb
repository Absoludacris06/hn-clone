helpers do 

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def find_user_posts(id)
    user = User.find(id)
    user.posts
  end

  def find_user_comments(id)
    user = User.find(id)
    user.comments
  end

end
