get '/post/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  @comments = @post.comments
  erb :post
end

before '/comment/new/:post_id' do
  unless logged_in?
    redirect to('/login')
  end
end

post '/comment/new/:post_id' do
  Comment.create(content: params[:content], user: current_user, post: Post.find(params[:post_id]))
  redirect to("/post/#{params[:post_id]}")
end

before '/new_post' do
  unless logged_in?
    redirect to('/login')
  end
end

get '/new_post' do
  erb :create_post
end

post '/new_post' do
  @new_post = Post.create(title: params[:title], url: params[:url], user: current_user)
  if @new_post.errors.full_messages.nil?
    @errors = @new_post.errors.full_messages
    erb :create_post
  else
    redirect to("/post/#{@new_post.id}")
  end
end
