module Mutations
  class CreateNewsletter < BaseMutation
    argument :newsletter_args, Types::NewsletterArgs, required: true

    field :newsletter, Types::NewsletterType, null: false
    field :msg, String, null: false
    
    def resolve(newsletter_args:)
      entry = Newsletter.create!( newsletter_args.to_h )
      message = "Newsletter Created!"
      {msg: message , newsletter: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Newsletter could not be created")
    end
  end
end