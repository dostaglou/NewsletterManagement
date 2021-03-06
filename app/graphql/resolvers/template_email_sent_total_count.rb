module Resolvers
  class TemplateEmailSentTotalCount < Resolvers::Base
    argument :timeframe_filter, Types::TimeframeFilter, required: false
    argument :newsletter_id, ID, required: true  
    argument :template_id, ID, required: true

    type GraphQL::Types::JSON, null: false

    def resolve(newsletter_id: nil, template_id: nil, timeframe_filter: "days")
      self.me? 
      date_arr = (0..6).to_a.reverse
      data = {}
       
      return self.crisis("Must be a Template-Newsletter pair belonging to you") unless template = me.templates.find_by(newsletter_id: newsletter_id, id: template_id)
      case
      when timeframe_filter == "days"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.days.ago).count 
          data[el.days.ago] = number
        end
      when timeframe_filter == "weeks"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.weeks.ago).count 
          data[el.weeks.ago] = number
        end
      when timeframe_filter == "months"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.months.ago).count 
          data[el.months.ago] = number
        end
      when timeframe_filter == "years"
        date_arr.each do |el|
          number = template.email_sents.where("created_at < ?", el.years.ago).count 
          data[el.years.ago] = number
        end
      end
      data
    end
  end
end