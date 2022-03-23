class User < ApplicationRecord
    attr_reader :password
    before_validation :ensure_session_token

    validates :username, :session_token, uniqueness: true, presence: true
    validates :password_digest, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def check_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
    
    def self.find_by_credentials(username, password) # used in session controller
        user = User.find_by(username: username)
        if user && user.check_password?(password) 
            user 
        else  
            nil
        end 
    end 

    def reset_session_token! ## we call this method every time we log a user in or out
        self.session_token = SecureRandom::urlsafe_base64(16)
        self.save! ## used to error out loudly 
        self.session_token  ## we return the session_token so that we can use it in our login! method
    end 
end

# find_by_credentials       DONE
# check_password?           DONE 
# password=                 DONE
# ensure_session_token      DONE
# reset_session_token       DONE
# associations





#create a user
#user1 will have session token
#allow user1 to receive new session token
#compare the two

#user.session_token = securerandom
#new sessoin token = securerandom
#user.session != new sessiontoken 