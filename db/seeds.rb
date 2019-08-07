require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

User.delete_all
Match.delete_all
Relationship.delete_all

# Users
User.create!(name:  "Example User",
  username: "Username",
  password:              "foobar",
  avatar: "img_url")

99.times do
name  = Faker::Sports::Football.player
username = Faker::Sports::Football.team
password = "password"
avatar = "img_url"
User.create!(name:  name,
    username: username,
    password: password,
    avatar: avatar)
end

# Matches

Match.create!(user_id: 1,
  sport: "Sport",
  opponent_id: 2,
  opponent_name: '',
  user_score: 1,
  opponent_score: 0)

99.times do
  user_id = rand(1..99)
  sport = Faker::Game.title
  opponent_id = rand(1..99)
  opponent_name = Faker::Sports::Football.player
  user_score = rand(1..20)
  opponent_score = rand(1..20)
  Match.create!(user_id: user_id,
    sport: sport,
    opponent_id: opponent_id,
    opponent_name: opponent_name,
    user_score: user_score,
    opponent_score: opponent_score)
end

# Following relationships

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
