modules Types
  class NewsletterArgs < BaseInputObject

    argument :name, String, required: false
    argument :subscriber_id, ID, required: false

  end
end