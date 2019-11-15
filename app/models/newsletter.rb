class Newsletter < ApplicationRecord
  belongs_to :manager, counter_cache: true
  has_many :subscribers
  has_many :templates
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
