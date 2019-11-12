module Types
  class ArgsSubscriber < BaseInputObject
    description "Universal Subscriber Arguments"

    argument :fullname, String, required: false
    argument :email, String, required: false
    argument :newsletter_id, ID, required: false
  end
end

