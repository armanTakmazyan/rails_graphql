class User < ApplicationRecord
    has_secure_password
    has_many :refresh_tokens, dependent: :destroy 

    validates :name, presence: true, length: { minimum: 2, maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Requires a valid email format' }, uniqueness: true
    validates :password, presence: true, length: { minimum: 4, maximum: 100 }
    validates :admin, :inclusion => { :in => [true, false] }, allow_blank: true
end
