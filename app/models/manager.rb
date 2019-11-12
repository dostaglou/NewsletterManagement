class Manager < ApplicationRecord
    validates :fullname, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
