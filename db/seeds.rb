require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

User.delete_all
Sport.delete_all
Match.delete_all
Relationship.delete_all

# Sports

football = Sport.create(name: 'football')
football.score_events.create(name: 'goal', point_value: 1)
football.match_events.create(name: 'yellow card')
football.match_events.create(name: 'red card')
football.match_events.create(name: 'corner')
football.match_events.create(name: 'free kick')
football.match_events.create(name: 'penalty')

rugby = Sport.create(name: 'rugby')
rugby.score_events.create(name: 'try', point_value: 5)
rugby.score_events.create(name: 'penalty kick', point_value: 3)
rugby.score_events.create(name: 'conversion', point_value: 2)
rugby.score_events.create(name: 'drop goal', point_value: 3)
rugby.match_events.create(name: 'yellow card')
rugby.match_events.create(name: 'red card')
rugby.match_events.create(name: 'penalty')

basketball = Sport.create(name: 'basketball')
basketball.score_events.create(name: 'two-pointer', point_value: 2)
basketball.score_events.create(name: 'three-pointer', point_value: 3)
basketball.score_events.create(name: 'free throw', point_value: 1)
basketball.match_events.create(name: 'SLAMDUNK!')
basketball.match_events.create(name: 'foul')

table_tennis = Sport.create(name: 'table-tennis')
table_tennis.score_events.create(name: 'point', point_value: 1)

lacrosse = Sport.create(name: 'lacrosse')
lacrosse.score_events.create(name: 'goal', point_value: 1)
lacrosse.match_events.create(name: 'one min penalty')
lacrosse.match_events.create(name: 'two min penalty')

hockey = Sport.create(name: 'hockey')
hockey.score_events.create(name: 'goal', point_value: 1)
hockey.match_events.create(name: 'penalty corner')
hockey.match_events.create(name: 'penalty stroke')

# Users
User.create!(name:  "Example User",
  username: "Username",
  password:              "foobar",
  avatar: "1")

99.times do
name  = Faker::Address.country
username =  Faker::Creature::Animal.name + rand(1..999).to_s
password = "password"
avatar = rand(1..19)
User.create!(name:  name,
    username: username,
    password: password,
    avatar: avatar)
end

# Matches

Match.create!(user_id: 1,
  sport: football,
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
    sport_id: rand(1..6),
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

# Happened events

1000.times do
  dice = (rand(1..6))
  if dice == 1
    player = Faker::Address.country
  else
    player = User.find(rand(1..User.all.length)).name
  end
  
  player_name = Faker::Sports::Football.player
  match = Match.find(rand(1..Match.all.length))
  match_event = MatchEvent.find(rand(1..MatchEvent.all.length))
  
  HappenedEvent.create!(
    player: player,
    match_id: match.id,
    match_event_id: match_event.id,
    player_name: player_name)
end

# Happened sports events

300.times do
  dice = (rand(1..6))
  if dice == 1
    player = Faker::Address.country
  else
    player = User.find(rand(1..User.all.length)).name
  end
  
  player_name = Faker::Sports::Football.player
  match = Match.find(rand(1..Match.all.length))
  score_event = ScoreEvent.find(rand(1..ScoreEvent.all.length))
  
  HappenedScoreEvent.create!(
    player: player,
    match_id: match.id,
    score_event_id: score_event.id,
    player_name: player_name)
end