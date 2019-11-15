module Resolvers
  class TemplateEmailSentTotalCount < Resolvers::Base
    argument :filter_subscriber_stats, Types::FilterSubscriberStats, required: false
    argument :newsletter_id, ID, required: true  
    argument :template_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id:, template_id:, filter_subscriber_stats:)
      self.me? 
      return { msg: "Must be a Template or Newsletter belonging to you" } unless template = me.templates.find_by(newsletter_id: newsletter_id, id: template_id)
      date_arr = (0..6).to_a.reverse
      data = {}
      case
      when filter_subscriber_stats == "days"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.days.ago).count 
          data[el.days.ago] = number
        end
      when filter_subscriber_stats == "weeks"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.weeks.ago).count 
          data[el.weeks.ago] = number
        end
      when filter_subscriber_stats == "months"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.months.ago).count 
          data[el.months.ago] = number
        end
      when filter_subscriber_stats == "years"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.years.ago).count 
          data[el.years.ago] = number
        end
      end
      data
    end
  end
end