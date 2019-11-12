module Mutations
  class CreateSubscriber < BaseMutation
    argument :subscriber_args, Types::SubscriberArgs, required: true

    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: false

    def resolve(subscriber_args:)
      entry = Subscriber.create!( subscriber_args.to_h )
      message = "Manager Account Created!"
      {msg: message , subscriber: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Account could not be created")  
    end
  end
end


