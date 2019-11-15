module Mutations
  class SubscriberCreate < BaseMutation
    argument :args_subscriber, Types::ArgsSubscriber, required: true
    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: false

    def resolve(args_subscriber:)
      data = args_subscriber.to_h
      data[:status] = "subbed"
      entry = Subscriber.create!( data )
      message = "Subscription Created!"
      {msg: message , subscriber: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Account could not be created")  
    end
  end
end


