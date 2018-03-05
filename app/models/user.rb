class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}
  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 5 }
  def self.authenticate_with_credentials(email, password)
    em = email.squish.downcase
    p em
    user = User.find_by_email(em)
    if user && user.authenticate(password)
     user
    else
     nil
    end
  end
end
