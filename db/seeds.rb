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
	Wiki.create!(
		title: RandomData.random_sentence,
		body:  RandomData.random_paragraph,
		user:  users.sample,
	)	
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"