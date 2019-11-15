module Resolvers
  class ManagerNewsletterList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::NewsletterType], null: true

    def resolve(pagination:[0,10])
      self.me?
      me.newsletters.order(id: "desc")&.offset(pagination[0])&.limit(pagination[1])
    end
  end
end