module Resolvers
  class ManagerSubscriberList < Base
    argument :pagination, Types::Pagination, required: false
    type [Types::SubscriberType], null: true

    def resolve(pagination:[0,10])
      self.me?
      me.subscribers.order(id: "desc")&.offset(pagination[0])&.limit(pagination[1])
    end
  end
end