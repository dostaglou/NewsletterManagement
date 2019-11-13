primary_users = %w( zelda dillon pat jordan francios yoshi daisuke )
generic_users = ("a".."z").to_a

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
      name: Faker::FunnyName.name,
      manager_id: m.id
    )
    n.save
    puts "newsletter #{n.name} created"
    2.times do 
      t = Template.new( 
        name: Faker::FunnyName.name,
        newsletter_id: n.id,
        content: "I am tempalte content",
        header: "I am header content",
      )
      t.save
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
      newsletter_id: newsletters.sample
    )
    puts "created: #{s}"
  end
  puts "NEXT IN LINE!"
end