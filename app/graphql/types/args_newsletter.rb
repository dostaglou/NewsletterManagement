module Types
  class ArgsNewsletter < BaseInputObject
    description "Universal Newsletter Arguments"

    argument :name, String, required: false
    argument :manager_id, ID, required: false
    
  end
end

