module Resolvers
  class NewsletterSubscriberTotalCount < Resolvers::Base

    argument :filter_subscriber_stats, Types::FilterSubscriberStats, required: false
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, filter_subscriber_stats: nil)
      self.me?
      return { msg: "Must be a Template or Newsletter belonging to you" } unless newsletter = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      case
      when filter_subscriber_stats == "days"
        return newsletter.subscribers.where(created_at: (7.days.ago)..(Date.today)).group('STRFTIME("%d", created_at)').count
      when filter_subscriber_stats == "weeks"
        return newsletter.subscribers.where(created_at: (7.weeks.ago)..(Date.today)).group('STRFTIME("%W", created_at)').count
      when filter_subscriber_stats == "months"
        return newsletter.subscribers.where(created_at: (7.months.ago)..(Date.today)).group('STRFTIME("%m", created_at)').count
      when filter_subscriber_stats == "years"
        return newsletter.subscribers.where(created_at: (7.years.ago)..(Date.today)).group('STRFTIME("%Y", created_at)').count
      end
      { data: "no data found with query" }
    end
  end
end
