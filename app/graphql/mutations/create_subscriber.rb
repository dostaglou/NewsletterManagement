module Mutations
  class CreateSubscriber < BaseMutation
    argument :args_subscriber, Types::ArgsSubscriber, required: true

    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: false

    def resolve(args_subscriber:)
      entry = Subscriber.create!( args_subscriber.to_h )
      message = "Manager Account Created!"
      {msg: message , subscriber: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Account could not be created")  
    end
  end
end


