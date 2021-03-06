module Mutations 
  class TemplateDestroy < BaseMutation
    argument :template_id, ID, required: true

    field :msg, String, null: false
    field :template, Types::TemplateType, null: true

    def resolve(template_id:)
      self.me?
      entry = Template.where(id: template_id).where(newsletter_id: [me.newsletters.pluck(:id)].flatten).first
      if entry&.status = "unsubbed"
        message = "Your Tempalte has been deleted"
        return { msg: message, template: entry }
      else
        self.crisis("could not delete template. Please confirm ID")
      end
    end
  end
end