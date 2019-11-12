module Types
  class ArgsManager < BaseInputObject
    # graphql_name "Universal Manager Arguments"
    description "Universal Manager Arguments"

    argument :name, String, required: false
    argument :email, String, required: false
    argument :password, String, required: false
    
  end
end

