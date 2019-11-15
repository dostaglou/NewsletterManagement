module Resolvers
  class NewsletterSubscriberTotalCount < Resolvers::Base

    argument :filter_subscriber_stats, Types::FilterSubscriberStats, required: false
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, filter_subscriber_stats: nil)
      self.me?
      return { msg: "Must be a Template or Newsletter belonging to you" } unless newsletter = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      date_arr = (0..6).to_a.reverse
      data = {}
      case
      when filter_subscriber_stats == "days"
        date_arr.each do |el|
          number = newsletter.subscribers.where("created_at < ?", el.days.ago).count 
          data[el.days.ago] = number
        end
      when filter_subscriber_stats == "weeks"
        date_arr.each do |el|
          number = newsletter.subscribers.where("created_at < ?", el.weeks.ago).count 
          data[el.weeks.ago] = number
        end
      when filter_subscriber_stats == "months"
        date_arr.each do |el|
          number = newsletter.subscribers.where("created_at < ?", el.months.ago).count 
          data[el.months.ago] = number
        end
      when filter_subscriber_stats == "years"
        date_arr.each do |el|
          number = newsletter.subscribers.where("created_at < ?", el.years.ago).count 
          data[el.years.ago] = number
        end
      end
      data
    end
  end
end
