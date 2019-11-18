primary_users = %w( zelda dillon pat jordan francios yoshi daisuke )
set1 = ("a".."z").to_a
set2 = ("A".."Z").to_a
generic_users = set1 + set2

primary_users.each do |u|
  m = Manager.new(
    name: "#{u}",
    email: "#{u}@#{u}.com",
    password: "123123"
  )
  m.save!
  puts "manager #{u} created"
  4.times do 
    n = Newsletter.new(
      name: "#{m.name}'s newsletter",
      manager_id: m.id
    )
    n.save!
    puts "newsletter #{n.name} created"
    2.times do 
      t = Template.new( 
        name: "#{m.name}'s template",
        newsletter_id: n.id,
        content: "I am template content",
        header: "I am header content",
      )
      t.save!
      puts "template #{t.name} created"
    end
  end
end

newsletters = Newsletter.all.pluck(:id)

generic_users.each do |u|
  5.times do 
    s = Subscriber.create!( 
      fullname: "#{u}",
      email: "#{u}@#{u}.com",
      newsletter_id: newsletters.sample,
      created_at: (rand*14).days.ago
    )
    puts "created: #{s}"
  end
  puts "NEXT IN LINE!"
end

set1.each do |u|
  5.times do 
    s = Subscriber.create!( 
      fullname: "#{u}",
      email: "#{u}@#{u}.com",
      newsletter_id: newsletters.sample,
      created_at: (rand*8).round.weeks.ago
    )
    puts "created: #{s}"
  end
  puts "NEXT IN LINE!"
end

set2.each do |u|
  5.times do 
    s = Subscriber.create!( 
      fullname: "#{u}",
      email: "#{u}@#{u}.com",
      newsletter_id: newsletters.sample,
      created_at: (rand*24).round.months.ago
    )
    puts "created: #{s}"
  end
  puts "NEXT IN LINE!"
end

subs = Subscriber.all

subs.each_with_index do |sub, index|
  if index.even?
    sub.status = "unsubbed"
    sub.unsub_date = Date.yesterday
    puts "one unsubbed"
  end
end