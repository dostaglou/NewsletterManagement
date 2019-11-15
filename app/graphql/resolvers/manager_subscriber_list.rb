module Resolvers
  class ManagerSubscriberList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::SubscriberType], null: true

    def resolve(pagination:{offset: 0, limit: 10})
      self.me?
      me.subscribers.order(id: "desc")&.offset(pagination[:offset])&.limit(pagination[:limit])
    end
  end
end