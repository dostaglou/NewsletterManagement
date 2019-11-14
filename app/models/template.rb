class Template < ApplicationRecord
  belongs_to :newsletter, counter_cache: true
  validates :name, presence: true, uniqueness: true
  has_many :email_sents
end
