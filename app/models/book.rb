class Book < ApplicationRecord
    validates :title, {presence: true, uniqueness: true}
    validates :author, presence: true
    validates :publisher, presence: true
end
