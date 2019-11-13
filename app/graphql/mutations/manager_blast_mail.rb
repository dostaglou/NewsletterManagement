module Mutations
  class ManagerBlastMail < BaseMutation
    argument :template_id, ID, required: true
    argument :newsletter_id, ID, required: true
    field :msg, String, null: false

    def resolve(template_id:, newsletter_id:)
      self.me?
      return { msg: "can't find newsletter" } unless newsletter = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      return { msg: "can't find template" } unless template = Template.find_by(id: template_id, newsletter_id: newsletter.id)
      newsletter.subscribers.each do |sub|
        sub.send_mail(template, newsletter.name)
      end
      { msg: "sent" } 
    end
  end
end