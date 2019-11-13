module Mutations
  class NewsletterUpdate < BaseMutation
    argument :args_newsletter, Types::ArgsNewsletter, required: true
    argument :newsletter_id, ID, required: true
    field :newsletter, Types::NewsletterType, null: true
    field :msg, String, null: false
    
    def resolve(args_newsletter:, newsletter_id:)
      self.me?
      entry = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      if entry 
        entry.update!( args_newsletter.to_h )
        message = "Newsletter Updated!"
        {msg: message , newsletter: entry}
      else
        return {newsletter: nil, msg: "Could not find submitted newsletter id belonging to you" }
      end
    end
  end
end