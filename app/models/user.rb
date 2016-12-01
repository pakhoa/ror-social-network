class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :posts

  def is_admin?
  	self.email && ENV['ADMIN_EMAILS'].to_s.include?(self.email)
  end
end
