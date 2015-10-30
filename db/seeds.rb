# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "pizzanfruit@gmail.com",
             name: "Pizza",
             age: 12,
             height: 1.75,
             weight: 60,
             password:              "12345678",
             password_confirmation: "12345678")

User.create!(email: "cloudwhite2812@gmail.com",
             name: "Cloud",
             age: 24,
             height: 1.8,
             weight: 100,
             password:              "12345678",
             password_confirmation: "12345678")