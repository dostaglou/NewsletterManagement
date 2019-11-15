module Resolvers
  class ManagerNewsletterList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::NewsletterType], null: true

    def resolve(pagination: {offset: 0, limit: 10, order: { :id => :desc } })
      self.me?
      me.newsletters.order(pagination[:order])&.offset(pagination[:offset])&.limit(pagination[:limit])
    end
  end
end