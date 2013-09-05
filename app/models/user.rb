class User < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  def self.authenticate(email, password)
  @user = User.find_by_email(email)
    if @user.password == password
      session[:user_id] = @user.id
    end
  end
  
end
