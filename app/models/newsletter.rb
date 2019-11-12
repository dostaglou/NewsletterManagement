class Newsletter < ApplicationRecord
  belongs_to :subscriber
  belongs_to :manager

  validates :name, presence: true, uniqueness: true
end
