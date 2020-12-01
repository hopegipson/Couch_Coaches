# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["first_name", "last_name", "email", "username", "password", "admin"],
  :users => [
    ["Hope", "Gipson", "hope@gmail.com", "hopegipson", "password", true],
    ["Faith", "Gipson", "faith@gmail.com", "faithgipson", "password", false],
    ["Henry", "Seaton", "henry@gmail.com", "henryseaton", "password", false],
    ["Cay", "Aldag", "cay@gmail.com", "cayaldag", "password", false],
    ["Curtis", "Gipson", "curtis@gmail.com", "curtisgipson", "password", false],
    ["Coni", "Gipson", "coni@gmail.com", "conigipson", "password", false],
    ["Blake", "Ford", "blake@gmail.com", "blakeford", "password", false],
    ["Charlie", "Maurer", "charlie@gmail.com", "charliemaurer", "password", false]

  ]}


  DATA2 = {
  :team_keys =>
  ["name"],
 :teams => [
   ["Free Agent"],
   ["Run CMC"],
   ["Mixon It Up"],
   ["Golladay Inn Express"],
   ["Mahomes Alone"],
   ["Party Like A Gronk Star"],
   ["View From Lamar"],
   ["Little Red Fournette"]
 ]}
 #DATA3 = {
 # :admins => [
  #  "hopegipson"
 # ]
#}

def main
  make_users
  make_teams
 # make_admin
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

#def make_admin
  #DATA3[:admins].each do |name|
   # User.create(username: name, admin: true, password: 'password')
 # end
#end

def make_teams
  DATA2[:teams].each do |team|
    new_team = Team.new
    team.each_with_index do |attribute, i|
      new_team.send(DATA2[:team_keys][i] + "=", attribute)
    end
    new_team.save
  end
end


main

hope = User.find_by(id: 1)
faith = User.find_by(id: 2)
henry = User.find_by(id: 3)
cay = User.find_by(id: 4)
curtis = User.find_by(id: 5)
coni = User.find_by(id: 6)
blake = User.find_by(id: 7)
charlie = User.find_by(id: 8)
team1 = Team.find_by(id: 1)
team2 = Team.find_by(id: 2)
team3 = Team.find_by(id: 3)
team4 = Team.find_by(id: 4)
team5 = Team.find_by(id: 5)
team6 = Team.find_by(id: 6)
team7 = Team.find_by(id: 7)
team8 = Team.find_by(id: 8)

team1.users << hope
team1.save
team2.users << faith
team2.save
team3.users << henry
team3.save
team4.users << cay
team4.save
team5.users << curtis
team5.save
team6.users << coni
team6.save
team7.users << blake
team7.save
team8.users << charlie
team8.save