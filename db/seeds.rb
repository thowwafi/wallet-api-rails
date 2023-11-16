# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = [
    {:email => "user1@wallet.co", :password=> "password"},
    {:email => "user2@wallet.co", :password =>"password"}
]
users.each do |user|
    User.find_or_create_by!(email: user[:email], password: user[:password])
end

teams = [
    {:team_name => "team1"},
    {:team_name => "team2"},
]
teams.each do |team|
    Team.find_or_create_by!(team_name: team[:team_name])
end

stocks = [
    {:symbol => "TSLA"},
    {:symbol => "GOOG"},
]
stocks.each do |stock|
    Stock.find_or_create_by!(symbol: stock[:symbol])
end

