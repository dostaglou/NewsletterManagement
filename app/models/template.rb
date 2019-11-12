class Template < ApplicationRecord
  belongs_to :newsletter
  validates :name, presence: true, uniqueness: true
end
