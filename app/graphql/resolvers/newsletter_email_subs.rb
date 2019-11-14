module Resolvers
  class NewsletterEmailSubs < Resolvers::Base
    argument :template_id, ID, required: true
    argument :newsletter_id, ID, required: true
    type String, null: false

    def resolve(template_id:, newsletter_id:)
      self.me?
      return "can't find newsletter" unless newsletter = Newsletter.find_by(id: newsletter_id, manager_id: me.id)
      return "can't find template"  unless template = Template.find_by(id: template_id, newsletter_id: newsletter.id)
      
      newsletter.subscribers.each do |sub|
        send_mail(template, newsletter.name, sub)
      end
      "Emails have been sent"
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
  end
end