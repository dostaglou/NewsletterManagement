module Types
    class ManagerType < BaseObject
        field :id, ID, null: false
        # remove the email later - should never be returned in production
        field :email, String, null: false 
        field :name, String, null: false
        field :newsletters, [Types::NewsletterType], null: true
        field :subscribers, [Types::SubscriberType], null: true
        field :newsletters_count, Integer, null: false
        field :subscribers_count, Integer, null: false

        def newsletters_count
          object.newsletters.count
        end
        def subscribers_count
          object.subscribers.count
        end
    end
end