module Resolvers
  class TemplateSingle < Resolvers::Base
    argument :template_id, ID, required: true

    type Types::TemplateType, null: true
    
    def resolve(template_id:)
      self.me?
      self.no_access unless me.templates.find_by(id: template_id)
    end
  end
end