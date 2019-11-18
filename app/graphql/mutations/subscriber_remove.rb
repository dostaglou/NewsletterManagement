module Mutations
  class SubscriberRemove < BaseMutation
    argument :subscriber_id, ID, required: true

    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: true

    def resolve(subscriber_id:)
      self.me?
      message = "Please reconfirm sub id"
      return self.crisis(message) unless entry = me.subscribers.find_by(id: subscriber_id)
      entry.status = "unsubbed"
      entry.unsub_date = Date.today
      { msg: "subscriber unsubbed", subscriber: entry }
    end
  end
end