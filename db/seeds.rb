# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

role = Role.new
role.name = "admin"
role.save

user = User.new 
user.email = "admin@gmail.com"
user.password = "password"
user.role_ids = [role.id]
user.save


model_lists = ["Employee","ServiceEntry","Vehicle","User","Role"].sort!
model_lists.map{|m| ModelList.create(name: m)}

ModelList.all.each do |m|
  p = Permission.new
  p.role_id = role.id
  p.model_list_id = m.id
  p.is_create = true
  p.is_read = true
  p.is_update = true
  p.is_destroy = true
  p.save
end