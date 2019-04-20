# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.new 
# user.email = "admin@gmail.com"
# user.password = "password"
# # user.is_admin = true
# user.save

role = Role.new
role.name = "admin"
role.save

model_lists = ["Vehicle","Employee","ServiceEntery"]
model_lists.map{|m| ModelList.create(name: m)}