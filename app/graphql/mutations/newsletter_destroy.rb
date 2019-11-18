module Mutations
  class NewsletterDestroy < BaseMutation
    argument :newsletter_id, ID, required: true
    field :newsletter, Types::NewsletterType, null: true
    field :msg, String, null: false
    
    def resolve(newsletter_id:)
      self.me?
      entry = me.newsletters.find_by(id: newsletter_id)
      if entry 
        entry.destroy
        message = "Newsletter Deleted!"
        {msg: message , newsletter: entry}
      else
        self.crisis("Could not find submitted newsletter id belonging to you" )
      end
    end
  end
end