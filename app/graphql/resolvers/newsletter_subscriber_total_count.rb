module Resolvers
  class NewsletterSubscriberTotalCount < Resolvers::Base
    argument :timeframe_filter, Types::TimeframeFilter, required: false
    argument :newsletter_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, timeframe_filter: "days")
      self.me?
      return { msg: "Must be a Template or Newsletter belonging to you" } unless newsletter = me.newsletters.find_by(id: newsletter_id)
      date_arr = (0..6).to_a.reverse
      data = {}
      case
      when timeframe_filter == "days"
        date_arr.each do |el|
          number = newsletter.subscribers
                              .where("created_at < ?", el.days.ago)
                              .where("unsub_date > ?", el.days.ago)
                  .or(newsletter.subscribers
                              .where("created_at < ?", el.days.ago)
                              .where(unsub_date: nil))
                              .count 
          data[el.days.ago] = number
        end
      when timeframe_filter == "weeks"
        date_arr.each do |el|
          number = newsletter.subscribers
                              .where("created_at < ?", el.weeks.ago)
                              .where("unsub_date > ?", el.weeks.ago)
                  .or(newsletter.subscribers
                              .where("created_at < ?", el.weeks.ago)
                              .where(unsub_date: nil))
                              .count 
          data[el.days.ago] = number
        end
      when timeframe_filter == "months"
        date_arr.each do |el|
          number = newsletter.subscribers
                              .where("created_at < ?", el.montsh.ago)
                              .where("unsub_date > ?", el.montsh.ago)
                  .or(newsletter.subscribers
                              .where("created_at < ?", el.montsh.ago)
                              .where(unsub_date: nil))
                              .count 
          data[el.days.ago] = number
        end
      when timeframe_filter == "years"
        date_arr.each do |el|
          number = newsletter.subscribers
                              .where("created_at < ?", el.years.ago)
                              .where("unsub_date > ?", el.years.ago)
                  .or(newsletter.subscribers
                              .where("created_at < ?", el.years.ago)
                              .where(unsub_date: nil))
                              .count 
          data[el.days.ago] = number
        end
      end
      data
    end
  end
end
