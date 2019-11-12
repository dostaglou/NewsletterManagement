module Mutations
  class CreateNewsletter < BaseMutation
    argument :args_newsletter, Types::ArgsNewsletter, required: true

    field :newsletter, Types::NewsletterType, null: false
    field :msg, String, null: false
    
    def resolve(args_newsletter:)
      entry = Newsletter.create!( args_newsletter.to_h )
      message = "Newsletter Created!"
      {msg: message , newsletter: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Newsletter could not be created")
    end
  end
end