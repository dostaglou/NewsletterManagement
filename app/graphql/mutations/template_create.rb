module Mutations
  class TemplateCreate < BaseMutation
    argument :args_template, Types::ArgsTemplate, required: false

    field :msg, String, null: false
    field :template, Types::TemplateType, null: true

    def resolve(args_template:)
      self.me?
      parent_id = args_template.newsletter_id.to_i
      if Newsletter.find_by(id: parent_id, manager_id: me.id)
        entry = Template.create!( args_template.to_h )
        message = "Template Created"
        return { msg: message, template: entry }
      else
        message = "None of your newsletters have that ID"
        return { msg: message, template: nil}
      end
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Template could not be created - likely the name is already in use") 
    end
  end
end