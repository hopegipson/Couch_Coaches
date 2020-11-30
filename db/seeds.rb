# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["first_name", "last_name", "email", "username", "password"],
  :users => [
    ["Hope", "Gipson", "hope@gmail.com", "hopegipson", "password"],
    ["Faith", "Gipson", "faith@gmail.com", "faithgipson", "password"],
    ["Henry", "Seaton", "henry@gmail.com", "henryseaton", "password"],
    ["Cay", "Aldag", "cay@gmail.com", "cayaldag", "password"],
    ["Curtis", "Gipson", "curtis@gmail.com", "curtisgipson", "password"],
    ["Coni", "Gipson", "hope@gmail.com", "hopegipson", "password"]
  ]}

  DATA2 = {
  :team_keys =>
  ["name", "user_id"],
 :teams => [
   ["Free Agents", 1],
   ["Run CMC", 2],
   ["Mixon It Up", 3],
   ["Golladay Inn Express", 4],
   ["Mahomes Alone", 5],
   ["Party Like A Gronk Star", 6],
   ["View From Lamar", 2],
   ["Little Red Fournette", 3]
 ]}
 DATA3 = {
  :admins => [
    "Hope Gipson"
  ]
}

def main
  make_users
  make_teams
  make_admin
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

def make_admin
  DATA3[:admins].each do |name|
    User.create(username: name, admin: true, password: 'password')
  end
end

def make_teams
  DATA2[:teams].each do |team|
    new_team = Team.new
    team.each_with_index do |attribute, i|
      new_team.send(DATA2[:team_keys][i] + "=", attribute)
    end
  end
end

main