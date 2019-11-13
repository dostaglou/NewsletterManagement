module Types
  class ArgsTemplate < BaseInputObject
    description "Universal Template Arguments"

    argument :newsletter_id, ID, required: false
    argument :name, String, required: false
    argument :content, String, required: false
    # maybe not header?
    argument :header, String, required: false
  end
end