module Mutations
  class NewsletterUpdate < BaseMutation
    argument :args_newsletter, Types::ArgsNewsletter, required: true
    argument :newsletter_id, ID, required: true
    field :newsletter, Types::NewsletterType, null: true
    field :msg, String, null: false
    
    def resolve(args_newsletter:, newsletter_id:)
      self.me?
      entry = me.newsletters.find_by(id: newsletter_id)
      if entry 
        entry.update!( args_newsletter.to_h )
        message = "Newsletter Updated!"
        {msg: message , newsletter: entry}
      else
        me.crisis("Could not find newsletter belonging to you with that id") 
      end
    end
  end
end