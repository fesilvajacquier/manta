# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# destroying previous instances
puts 'detroying all the instances'
Message.destroy_all
Offer.destroy_all
Publication.destroy_all
Report.destroy_all
NgoMember.destroy_all
Ngo.destroy_all
User.destroy_all

# user
puts 'creating users'
fer = User.create!(email: 'fer@mail.com', password: '123456')
orlando = User.create!(email: 'orlando@mail.com', password: '123456')
pin = User.create!(email: 'pin@mail.com', password: '123456')
yuyu = User.create!(email: 'yuyu@mail.com', password: '123456')

# ngo
puts 'creating ngos'
manta_ngo = Ngo.new(name: 'mantango',
                        address: 'Niceto Vega, Buenos Aires, Argentina',
                        email: 'mantango@mail.com',
                        website: 'www.manta.com',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat justo lectus, non aliquam eros accumsan id. Nulla eget odio eget mi semper semper id sed sapien. Etiam commodo diam quis nullam.',
                        bank_account: 1)
manta_ngo.user = yuyu
manta_ngo.save!

# ngo_member
puts 'creating ngo_members'
NgoMember.create!(ngo: manta_ngo, user: pin)

# report
puts 'creating reports'
Report.create!(ngo: manta_ngo, phone_number: '123234234', category: 'something', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat justo lectus, non aliquam eros accumsan id. Nulla eget odio eget mi semper semper id sed sapien. Etiam commodo diam quis nullam.' )

# publication
puts 'creating publications'
pc_pub = Publication.create!(ngo: manta_ngo,
                    title: 'computer',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat justo lectus, non aliquam eros accumsan id. Nulla eget odio eget mi semper semper id sed sapien. Etiam commodo diam quis nullam.',
                    intended_use: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat justo lectus, non aliquam eros accumsan id. Nulla eget odio eget mi semper semper id sed sapien. Etiam commodo diam quis nullam.',
                    category: 'a category',
                    sub_category: 'a sub-category',
                    location: 'A location')

# offer
puts 'creating offers'
pc_offer = Offer.create!(user: orlando, publication: pc_pub )

# message
puts 'creating messages'
Message.create!(user: orlando, offer: pc_offer, content: 'somme content')

# pictures
# puts 'creating pictures'