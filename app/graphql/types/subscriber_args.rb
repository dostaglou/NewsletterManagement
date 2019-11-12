module Types
  class SubscriberArgs < BaseInputObject
    description "Universal Subscriber Arguments"

    argument :fullname, String, required: false
    argument :email, String, required: false
    
  end
end

