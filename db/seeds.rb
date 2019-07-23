# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
puts 'creating users'
fer = User.create!(email: 'fer@manta.com', password: '123456')
orlando = User.create!(email: 'orlando@manta.com', password: '123456')
pin = User.create!(email: 'pin@manta.com', password: '123456')
yuyu = User.create!(email: 'yuyu@manta.com', password: '123456')

# ngo
puts 'creating ngos'

# ngo_member
puts 'creating ngo_members'

# report
puts 'creating reports'

# publication
puts 'creating publications'

# offer
puts 'creating offers'

# message
puts 'creating messages'

# pictures
puts 'creating pictures'