module Resolvers
  class ManagerSubscriberList < Base
    argument :pagination, Types::Pagination, required: false
    # field :results, [Types::NewsletterType], null: true
    # field :msg, String, null: true
    type [Types::SubscriberType], null: true

    def resolve(pagination:[0,10])
      self.me?
      results = me.subscribers.order(id: "desc")&.offset(pagination[0])&.limit(pagination[1])
      message = "These are the newsletters you requested from #{pagination[0]} upto a max of #{pagination[0] + pagination[1]}"
      # {results: results, msg: message}
      results
    end
  end
end