class Newsletter < ApplicationRecord
  belongs_to :manager, counter_cache: true
  has_many :subscribers, dependent: :destroy
  has_many :templates, dependent: :destroy
  validates :name, presence: true

  after_create :generic_template

  def generic_template
    
    Template.create!(
      name: "generic",
      newsletter_id: self.id,
      content: "generic",
      header: "generic",
      status: "generic"
    )
  end
end
