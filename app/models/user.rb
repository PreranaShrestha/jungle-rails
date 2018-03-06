class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 5 }
  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = ?', email.squish.downcase).first
    if user && user.authenticate(password)
     user
    else
     nil
    end
  end
end
