# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
10.times do |n|
  m = 100 + n

  User.create(
    id:"#{m}", 
    email: "#{m}.gmail.com", 
    uid: "1532126193599581 + #{m}",
    provider: "facebook",
    name: "user_name#{m}"
  )

  Project.create(
    id: "#{m}",
    title: "タイトル#{m}",
    content: "概要#{m}"
  )

  Card.create(
    id: "#{n}",
    title: "タイトル0 カード#{n}",
    column_id: "0"
  )
end
=end