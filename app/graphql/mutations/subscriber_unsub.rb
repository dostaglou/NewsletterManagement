module Mutations
  class SubscriberUnsub < BaseMutation
    argument :sub_id, ID, required: true
    argument :unsub_code, String, required: true
    argument :args_subscriber, Types::ArgsSubscriber, required: true

    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: true

    def resolve(args_subscriber:, sub_id:, unsub_code:)
      message = "No Action : please verify id, code, and email"
      return { msg: message, subscriber: nil } unless entry = Subscriber.find_by(id: sub_id, email: args_subscriber[:email])
      return { msg: message, subscriber: nil } unless entry.unsub_code == unsub_code
      entry.status = "unsubbed"
      entry.save
      message = "you are unsubed"
      {msg: message, subscriber: entry}
    end

  end
end