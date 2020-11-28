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
    ["Coni", "Gipson", "hope@gmail.com", "hopegipson", "password"],
    ["Davis Cleveland", 1, 3, 5, 36, "password"],
  ],
  :admins => [
    "Hope Gipson",
  ]
}