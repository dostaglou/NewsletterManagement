module Resolvers
  class NewsletterSubscriberStats < Resolvers::Base

    # need range and newsletter_id
    argument :filter_subscriber_stats, Types::FilterSubscriberStats, required: false
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, filter_subscriber_stats: nil)

      case
      when filter_subscriber_stats == "days"
        time_frame = (Date.today - 1.week)..(Date.today.end_of_day)
      when filter_subscriber_stats == "weeks"
        time_frame = (Date.today - 7.week)..(Date.today.end_of_day)
      when filter_subscriber_stats == "months"
        time_frame = (Date.today - 7.month)..(Date.today.end_of_day)
      when filter_subscriber_stats == "years"
        time_frame = (Date.today - 7.year)..(Date.today.end_of_day)
      end
      Subscriber.where(newsletter_id: newsletter_id)
      .where(created_at: time_frame)
      .group("date(created_at)")
      .count 
    end
  end
end