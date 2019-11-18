module Resolvers
  class NewsletterTemplateList < Resolvers::Base
    argument :pagination, Types::Pagination, required: false
    argument :newsletter_id, ID, required: true
    type [Types::TemplateType], null: true

    def resolve(pagination:{offset: 0, limit: 10, order: { :id => :desc } }, newsletter_id:)
      self.me?
      results = me.templates
                  .where(newsletter_id: newsletter_id)
                  .order(pagination[:order])
                  .offset(pagination[:offset])
                  .limit(pagination[:limit])
      results.nil? ? self.no_access : results
    end
  end
end