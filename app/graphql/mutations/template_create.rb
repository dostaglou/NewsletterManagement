module Mutations
  class TemplateCreate < BaseMutation
    argument :args_template, Types::ArgsTemplate, required: false

    field :msg, String, null: false
    field :template, Types::TemplateType, null: true

    def resolve(args_template:)
      self.me?
      parent_id = args_template.newsletter_id.to_i
      if me.newsletters.find_by(id: parent_id) 
        entry = Template.create!( args_template.to_h )
        message = "Template Created"
        return { msg: message, template: entry }
      else
        self.crisis("None of your newsletters have that ID")
      end
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Template could not be created") 
    end
  end
end