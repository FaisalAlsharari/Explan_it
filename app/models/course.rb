class Course < ApplicationRecord
    validates :name,presence: true, allow_blank: false
    has_and_belongs_to_many :users
end
