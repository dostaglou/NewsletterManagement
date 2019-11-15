module Resolvers
  class NewsletterTemplateList < Resolvers::Base
    argument :pagination, Types::Pagination, required: false
    argument :newsletter_id, ID, required: true
    type [Types::TemplateType], null: true

    def resolve(pagination:[0,10], newsletter_id:)
      self.me?
      me.templates.where(newsletter_id: newsletter_id).order(id: "desc").offset(pagination[0]).limit(pagination[1])
    end
  end
end