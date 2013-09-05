class User < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true
  include BCrypt

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user.password == password
      @user.id
    else
      nil
    end
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
