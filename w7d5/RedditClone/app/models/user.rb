class User < ApplicationRecord
#FIGVAPER

validates :username, :email, presence: true, uniqueness: true
validates :password_digest, presence: true
validates :session_token, uniqueness: true
validates :password, length: {minimum: 6, allow_nil: true}

has_many :subs,
    foreign_key: :user_id,
    class_name: "Sub",
    primary_key: :id

attr_reader :password

def find_by_credentials(username, password)
    user = @user.find_by(params[:user][:username])
    if user && is_password?(password)
        user
    else
        nil
    end
end

def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
end

def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
end


def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
end

def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
end

end

