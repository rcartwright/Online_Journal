class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password

    before_save { self.email = email.downcase }

    mount_uploader :avatar, AvatarUploader

    belongs_to :blog
    has_many :posts
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
    				  format: { with: VALID_EMAIL_REGEX },
    				  uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    private

    def User.new_token
        SecureRandom.urlsafe_base64
    end
    def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
end
end
