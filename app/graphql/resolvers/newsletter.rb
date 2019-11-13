module Resolvers
  class Newsletter < Resolvers::Base
    argument :newsletter_id, ID, required: true

    type Types::NewsletterType, null: true

    def resolve(newsletter_id:)
      self.me?
      me.newsletters.find_by(id: newsletter_id)
    end
  end
end