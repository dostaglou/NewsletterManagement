module Mutations
  class TemplateUpdate < BaseMutation
    argument :args_template, Types::ArgsTemplate, required: false
    argument :template_id, ID, required: true

    field :msg, String, null: false
    field :template, Types::TemplateType, null: true

    def resolve(args_template:, template_id:)
      self.me?
      entry = Template.where(id: template_id).where(newsletter_id: [me.newsletters.pluck(:id)].flatten).first
      byebug
      data = args_template.to_h
      data.reject!{|key, _value| key == newsletter_id} if data[:newsletter_id]
      if entry
        entry.update(data)
        byebug
        message = "Template Updated"
        return { msg: message, template: entry }
      else
        message = "Template could not be updated - check arguments for accuracy and name uniqueness"
        return { msg: message, template: nil }
      end
    end
  end
end
