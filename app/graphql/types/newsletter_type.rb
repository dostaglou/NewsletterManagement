module Types
  class NewsletterType < BaseObject
      field :id, ID, null: true
      field :name, String, null: true
      field :manager, Types::ManagerType, null: true
      field :subscribers, [Types::SubscriberType], null: true
      field :templates, [Types::TemplateType], null: true
      field :newsletter_count, Integer, null: false
      field :subscribers_count, Integer, null: false
      field :template_count, Integer, null: false

      def subscribers_count
        object.subscribers.count
      end
      def template_count
        object.templates.count
      end
  end
end