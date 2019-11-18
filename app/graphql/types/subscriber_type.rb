module Types
    class SubscriberType < BaseObject
        field :id, ID, null: true
        field :email, String, null: true 
        field :fullname, String, null: true
    end
end