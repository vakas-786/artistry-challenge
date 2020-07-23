class Artist < ApplicationRecord
    has_many :songs
    has_many :instruments, through: :songs 

    validates :name, presence: true 
    validates :title, uniqueness: true 
end
