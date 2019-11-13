class Newsletter < ApplicationRecord
  belongs_to :manager#, counter_cache: true
  has_many :subscribers
  has_many :templates
  validates :name, presence: true, uniqueness: true
end
