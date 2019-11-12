class Newsletter < ApplicationRecord
  belongs_to :manager
  has_many :subscribers #dependent: destroy?
  has_many :templates, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
