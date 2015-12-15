require 'Faker'

20.times do
  User.create(email: Faker::Internet.email, password: "123", name: Faker::Name.name)
end

# Examples:
# 50.times do
#   Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: rand(1..20))
# end

# 50.times do
#   Comment.create(content: Faker::Lorem.paragraph, user_id: rand(1..20), post_id: rand(1..100))
# end
