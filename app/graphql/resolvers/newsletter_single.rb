module Resolvers
  class NewsletterSingle < Resolvers::Base
    argument :newsletter_id, ID, required: true

    type Types::NewsletterType, null: true

    def resolve(newsletter_id:)
      self.me?
      self.no_access unless me.newsletters.find_by(id: newsletter_id)
    end
  end
end