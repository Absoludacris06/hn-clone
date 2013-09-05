get '/login' do
  erb :login
end

post '/login' do
  if User.authenticate(params[:email], params[:password])
    session[:user_id] = User.find_by_email(params[:email]).id
    redirect to('/')
  else
    @errors = ["Incorrect email & password combination."]
    erb :login
  end
end 

get '/logout' do 
  session.clear
  redirect to('/')
end
