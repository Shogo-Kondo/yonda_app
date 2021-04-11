class User < ApplicationRecord
    validates :user_name, {presence: true, uniqueness: true}
    validates :password, {presence: true, length: { minimum: 8 }}
end
