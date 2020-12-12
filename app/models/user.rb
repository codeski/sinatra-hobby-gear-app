class User < ActiveRecord::Base
    has_secure_password

    has_many :hobbies
    has_many :items, through: :hobbies
end