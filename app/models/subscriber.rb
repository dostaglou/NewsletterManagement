class Subscriber < ApplicationRecord
  belongs_to :newsletter
  validates :fullname, presence: true
  validates :email, presence: true


  def send_mail(template, newsletter_name)
    byebug
    puts "I am sending some mail"
    puts "#{template[:header]}"
    puts "To: #{self.fullname}"
    puts "From: #{newsletter_name}!"
    puts "#{template[:content]}"
    puts "To unsub from these messages, email someone!"
  end
end
