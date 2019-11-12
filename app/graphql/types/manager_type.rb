module Types
    class ManagerType < BaseObject
        field :id, ID, null: false
        # remove the email later - should never be returned in production
        field :email, String, null: false 
        field :name, String, null: false
        # need to add the SUBSCRIPTION array  have
    end
end