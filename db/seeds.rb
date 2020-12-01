# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User Admin and dummy account
User.create!(name: "Admin Account",
  email: "framgia@email.com",
  password: "password",
  password_confirmation: "password",
  account_type: '1')

19.times do |n|
  name = Faker::Games::Witcher.character
  email = "dummy#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              account_type: '0')
end

#Category title and Description
19.times do |m|
  title = Faker::Game.title
  description = Faker::Game.genre
  Category.create!(title: title,
                  description: description)
end

#Words and Choices
category = Category.take(3)

4.times do
  words = Faker::Games::SuperSmashBros.stage
  c1 = Faker::Games::SuperSmashBros.fighter
  c2 = Faker::Games::SuperSmashBros.fighter
  c3 = Faker::Games::SuperSmashBros.fighter
  c4 = Faker::Games::SuperSmashBros.fighter

  category.each { |w| w.words.create!(word: words,
    :choices_attributes => 
      { 
           0 => { choices: c1, correct: '0' },
           1 => { choices: c2, correct: '1' },
           2 => { choices: c3, correct: '0' },
           3 => { choices: c4, correct: '0' }
       }
    )
  }
end

#follow part 
users = User.all
user = users.first 
following = users[2..5]
followers = users[3..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }