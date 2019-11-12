module Types
  class NewsletterType < BaseObject
      field :id, ID, null: true
      field :name, String, null: true
      field :manager, Types::ManagerType, null: true
      # add in SUBSCRIBERS here
  end
end