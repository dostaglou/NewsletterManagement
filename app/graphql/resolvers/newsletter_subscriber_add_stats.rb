module Resolvers
  class NewsletterSubscriberAddStats < Resolvers::Base
    
    argument :timeframe_filter, Types::TimeframeFilter, required: false
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, timeframe_filter: "days")
      self.me?
      return { msg: "Must be a Template or Newsletter belonging to you" } unless newsletter = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      case
      when timeframe_filter == "days"
        time_frame = (Date.today - 1.week)..(Date.today.end_of_day)
        grouping = 'STRFTIME("%d", created_at)'
      when timeframe_filter == "weeks"
        time_frame = (Date.today - 7.week)..(Date.today.end_of_day)
        grouping = 'STRFTIME("%W", created_at)'
      when timeframe_filter == "months"
        time_frame = (Date.today - 7.month)..(Date.today.end_of_day)
        grouping = 'STRFTIME("%m", created_at)'
      when timeframe_filter == "years"
        time_frame = (Date.today - 7.year)..(Date.today.end_of_day)
        grouping = 'STRFTIME("%Y", created_at)'
      end
      byebug
      newsletter.subscribers.where(created_at: time_frame)
      .group(grouping)
      .count 
    end
  end
end