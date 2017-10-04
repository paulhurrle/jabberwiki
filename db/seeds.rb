# require 'random_data'
require 'faker'

Faker::Name.unique.name       #=> "Christophe Bartell"
Faker::Internet.email         #=> "kirsten.greenholt@corkeryfisher.info"

# Create Users
15.times do
	User.create!(
		email: Faker::Internet.email,
		password: Faker::Internet.password,
	)
end
users = User.all

# Create Wikis
50.times do
	wiki = Wiki.create!(
		title: Faker::Hacker.say_something_smart,
		body:  Faker::Lorem.paragraph,
		user:  users.sample,
	)	

	wiki.update_attribute(:created_at, Faker::Time.between(1.year.ago, Time.now, :all))
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"