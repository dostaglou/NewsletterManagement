module Mutations
  class NewsletterCreate < BaseMutation
    argument :args_newsletter, Types::ArgsNewsletter, required: true

    field :newsletter, Types::NewsletterType, null: false
    field :msg, String, null: false
    
    def resolve(args_newsletter:)
      self.me?
      entry = Newsletter.new( args_newsletter.to_h )
      entry.manager = me 
      entry.save!
      message = "Newsletter Account Created!"
      {msg: message , newsletter: entry}
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Newsletter could not be created")
    end
  end
end