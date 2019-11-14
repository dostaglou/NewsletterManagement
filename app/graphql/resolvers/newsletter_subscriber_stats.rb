module Resolvers
  class NewsletterSubscriberStats < Resolvers::Base

    # need range and newsletter_id
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:)

      Subscriber.where(newsletter_id: newsletter_id)
                .where(created_at: (Date.today - 1.week)...(Date.today.end_of_day))
                .group("date(created_at)")
                .count   
    end
  end
end