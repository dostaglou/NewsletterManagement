module Resolvers
  class ManagerNewsletterList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::NewsletterType], null: true

    def resolve(pagination:{offset: 0, limit: 10})
      self.me?
      me.newsletters.order(id: "desc")&.offset(pagination[:offset])&.limit(pagination[:limit])
    end
  end
end