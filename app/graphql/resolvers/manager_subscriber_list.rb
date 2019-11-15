module Resolvers
  class ManagerSubscriberList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::SubscriberType], null: true

    def resolve(pagination:{offset: 0, limit: 10, order: { :id => :desc } })
      self.me?
      me.subscribers.order(pagination[:order])&.offset(pagination[:offset])&.limit(pagination[:limit])
    end
  end
end