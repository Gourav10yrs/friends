class User < ActiveRecord::Base
    has_many :articles
    before_save {self.email = email.downcase}
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                uniqueness: { case_sensitive: false }, 
                length: { minimum: 3 },
                format: { with: VALID_EMAIL_REGEX }
    # this used because we want to add hash password and add salt to it.  
    has_secure_password
end
