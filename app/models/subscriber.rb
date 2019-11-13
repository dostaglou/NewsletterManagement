class Subscriber < ApplicationRecord
  belongs_to :newsletter
  validates :fullname, presence: true
  validates :email, presence: true
end
