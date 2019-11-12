module Types
    class SubscriberType < BaseObject
        field :id, ID, null: true
        # remove the email later - should never be returned in production
        field :email, String, null: true 
        field :fullname, String, null: true
        # need to add the subscrition array they have
    end
end