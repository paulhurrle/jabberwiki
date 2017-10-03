require 'random_data'

# Create Users
5.times do
	User.create!(
		email: RandomData.random_email,
		password: RandomData.random_sentence,
	)
end
users = User.all

# Create Wikis
25.times do
	wiki = Wiki.create!(
		title: RandomData.random_sentence,
		body:  RandomData.random_paragraph,
		user:  users.sample,
	)	

	wiki.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"