class User < ApplicationRecord

def self.authenticate_with_credentials(email, password)
  email = email.downcase
  email = email.gsub(/\s+/, "")
  user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      user
    else
      nil
    end
end



  validates :email, uniqueness: { case_sensitive: false }
  validates :name, :email, presence: true
  validates :password, length: { minimum: 4 }

  has_secure_password

end
