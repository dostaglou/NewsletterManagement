module Mutations
  class NewsletterEmailSubs < BaseMutation
    argument :template_id, ID, required: false
    argument :non_template_content, String, required: false
    argument :newsletter_id, ID, required: true
    field :msg, String, null: false

    def resolve(template_id: nil, non_template_content: nil, newsletter_id:)
      self.me?
      self.crisis("please provide either a template or non-template-content") unless template_id || non_template_content
      
      if template_id
        # below line only modified
        self.crisis("can't find newsletter") unless newsletter = me.newsletters.find_by(id: newsletter_id)
        self.crisis("can't find template") unless template = Template.find_by(id: template_id, newsletter_id: newsletter.id)
        targets = ""
        newsletter.subscribers.each do |sub|
          send_mail(template, newsletter.name, sub)
          targets += "#{sub.id},"
        end
        
        EmailSent.create!(
          template_id: template_id.to_i,
          targets: targets
        )
      else
        # below line of code modified
        return "can't find newsletter" unless newsletter = me.newsletters.find_by(id: newsletter_id)
        generic_template = newsletter.templates.first.id
        targets = ""
        newsletter.subscribers.each do |sub|
          send_mail2(non_template_content, newsletter.name, sub)
          targets += "#{sub.id},"
        end
        EmailSent.create!(
          template_id: generic_template,
          targets: targets, 
        )
      end

      {msg: "Emails have been sent"}
    end

    def send_mail(template, newsletter_name, sub)
      puts "I am sending some mail"
      puts "#{template[:header]}"
      puts "To: #{sub.fullname}"
      puts "From: #{newsletter_name}!"
      puts "#{template[:content]}"
      puts "To unsub from these messages, please go to www.unsub/sub."
      puts "Enter your single code #{sub.id}, email address, and the following code: #{sub.unsub_code}"
    end
    def send_mail2(content, newsletter_name, sub)
      puts "I am sending some mail"
      puts "To: #{sub.fullname}"
      puts "From: #{newsletter_name}!"
      puts "#{content}"
      puts "To unsub from these messages, please go to www.unsub/sub."
      puts "Enter your single code #{sub.id}, email address, and the following code: #{sub.unsub_code}"
    end
  end
end