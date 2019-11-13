class Manager < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_many :newsletters, dependent: :delete_all
    has_many :subscribers, through: :newsletters
    has_many :templates, through: :newsletters
end
