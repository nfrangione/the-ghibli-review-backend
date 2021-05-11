class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    validates :username, presence: true
    validates :username, uniqueness: true

    validates :password, presence: true

end
