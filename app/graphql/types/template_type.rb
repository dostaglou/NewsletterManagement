module Types
  class TemplateType < BaseObject
    field :id, ID, null: false
    field :newsletter, Types::NewsletterType, null: false
    field :name, String, null: false
    field :content, String, null: true
    field :header, String, null: true
  end
end
