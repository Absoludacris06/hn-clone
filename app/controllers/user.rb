get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end

get '/user/:id/posts' do
  @posts = find_user_posts(params[:id])
  erb :index
end

get '/user/:id/comments' do
  @comments = find_user_comments(params[:id])
  erb :comment
end

post '/user/new' do
  @new_user = User.create(params[:user])
  if @new_user.errors.full_messages.nil?
    @errors = @new_user.errors.full_messages
    erb :login
  else
    redirect to('/')
  end
end
