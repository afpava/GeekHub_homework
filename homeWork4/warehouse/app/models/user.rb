class User < ApplicationRecord
skip_callback :commit, :after, :remove_image!
email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
validates :email, :presence => true, :uniqueness => true, :format => email_regex
validates :password, format: { with: /(?=.*?[0-9])(?=.*?[A-Za-z]).+/,
    message: "Password must contain at least one digit and one letter" }, length: { in: 6..10 }
has_secure_password

end
