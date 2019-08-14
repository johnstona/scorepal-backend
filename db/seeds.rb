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
  avatar: "1")

99.times do
name  = Faker::Sports::Football.player
username =  Faker::Sports::Football.team + rand(1..999).to_s
password = "password"
avatar = rand(1..19)
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
  opponent_score: 0,
  live: false)

99.times do
  user_id = rand(1..99)
  sport = Faker::Team.sport
  opponent_id = rand(1..99)
  opponent_name = Faker::Sports::Football.player
  user_score = rand(1..20)
  opponent_score = rand(1..20)
  live = (user_id > 70) ? true : false
  Match.create!(user_id: user_id,
    sport: sport,
    opponent_id: opponent_id,
    opponent_name: opponent_name,
    user_score: user_score,
    opponent_score: opponent_score,
    live: live)
end

# Following relationships

500.times do
  user1 = User.find(rand(1..99))
  user2 = User.find(rand(1..99))
  user1.follow(user2)
end
