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
fer = User.create!(first_name: 'Fernando', email: 'fer@mail.com', password: '123456')
orlando = User.create!(first_name: 'Orlando', email: 'orlando@mail.com', password: '123456')
pin = User.create!(first_name: 'Plengpai', email: 'pin@mail.com', password: '123456')
yuyu = User.create!(first_name: 'Yuyu', email: 'yuyu@mail.com', password: '123456')
sebas = User.create!(first_name: 'Sebastian', email: 'sebas@mail.com', password: '123456')
sam = User.create!(first_name: 'Samuel', email: 'sam@mail.com', password: '123456')
gerardo = User.create!(first_name: 'Gerardo', email: 'gerardo@mail.com', password: '123456')
remi = User.create!(first_name: 'Remi', email: 'remi@mail.com', password: '123456')

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

wikimedia_foundation = Ngo.new(name:'wikimedia foundation',
                                address: 'Av. Maipú 173, V9410 Ushuaia, Tierra del Fuego, Argentina',
                                email: 'info@wikimedia.org',
                                website: 'https://wikimediafoundation.org',
                                description:'The nonprofit Wikimedia Foundation provides the essential infrastructure for free knowledge. We host Wikipedia, the free online encyclopedia, created, edited, and verified by volunteers around the world, as well as many other vital community projects. All of which is made possible thanks to donations from individuals like you. We welcome anyone who shares our vision to join us in collecting and sharing knowledge that fully represents human diversity.',
                                bank_account: 2)
wikimedia_foundation.user = pin
wikimedia_foundation.save!


save_children = Ngo.new(name:'save children',
                 address:'Av. Hipólito Yrigoyen 511, X5004 Córdoba, Argentina',
                 email:'supportercare@savechildren.org',
                 website:'https://www.savethechildren.org',
                 description:'Transforming Lives and Futures
                  All across the globe, children are dying from preventable causes, missing out on education due to poverty or gender, suffering from violence, exploitation and neglect, and are vulnerable in times of crisis. In every corner of the world, children need a strong voice to stand up for them, work on their behalf and make their lives better.
                  Save the Children is the voice for vulnerable children. We’re on the ground in 120 countries, working to reach every last child through international programs that focus on health, education, protection and disaster relief. Together, we’re changing children’s lives and the future we all share.',
                 bank_account:3)
save_children.user = pin
save_children.save!

cambia = Ngo.new(name:'Cambia',
                 address:'Av. del Libertador 4400, M5500 Mendoza, Argentina',
                 email:'cambia@cambia.org',
                 website:'https://cambia.org',
                 description:'Cambia is a non profit social enterprise, creating new tools, technologies, and paradigms to promote change and enable innovation.
                  Our mission is to democratize innovation: to create a more equitable and inclusive capability to solve problems using science and technology. Our institutional ethos is built around an awareness of the need and opportunity for local commitment to achieving lasting solutions to food security, agricultural, public health and environmental problems.',
                 bank_account:4)
cambia.user = pin
cambia.save!

barefoot_college = Ngo.new(name:'barefoot college',
                 address:'Congreso de Tucumán 141, T4000IEC San Miguel de Tucumán, Argentina',
                 email:'volunteer@barefootcollege.org',
                 website:'https://www.barefootcollege.org',
                 description:"The Social Work and Research Centre ('SWRC'), widely known as the Barefoot College[1] is a voluntary organisation working in the fields of education, skill development, health, drinking water, women empowerment and electrification through solar power for the upliftment of rural people,which was founded by Bunker Roy in 1972. It is registered under Friends of Tilonia Inc.
                 The Villagers' Barefoot College in the village of Tilonia gives lessons in reading, writing and accounting to adults and children especially the drop-outs, cop-outs and wash-outs. Girls heavily outnumber boys in the night schools.In 2008 there were approximately 3,000 children attending 150 night schools" ,
                 bank_account:5)
barefoot_college.user = fer
barefoot_college.save!

code_for_america = Ngo.new(name: 'code for america',
                 address:'España 558, A4400 Salta, Argentina',
                 email:'info@codeforamerica.org',
                 website:'https://www.codeforamerica.org/about-us',
                 description:'We are a network of people making government work for the people, by the people, in the digital age. How do we get there? With government services that are simple, effective, and easy to use, working at scale to help all Americans, starting with the people who need them most.',
                 bank_account:6)
code_for_america.user = fer
code_for_america.save!


human_rights_watch = Ngo.new(name:'human rights watch',
                 address:'Av. Roque Perez, Posadas, Argentina',
                 email:'tilianm@hrw.org',
                 website:'https://www.hrw.org',
                 description:'Human Rights Watch investigates and reports on abuses happening in all corners of the world. We are roughly 450 people of 70-plus nationalities who are country experts, lawyers, journalists, and others who work to protect the most at risk, from vulnerable minorities and civilians in wartime, to refugees and children in need. We direct our advocacy towards governments, armed groups and businesses, pushing them to change or enforce their laws, policies and practices. To ensure our independence, we refuse government funding and corporate ties. We partner with organizations large and small across the globe to protect embattled activists and to help hold abusers to account and bring justice to victims.',
                 bank_account:7)
human_rights_watch.user = fer
human_rights_watch.save!

care_international = Ngo.new(name:'Care international',
                 address:'Pelagio B. Luna 811, F5300 La Rioja, Argentina',
                 email:'cisecretariat@careinternational.org',
                 website:'https://www.care-international.org',
                 description:'CARE is a major international humanitarian agency delivering emergency relief and long-term international development projects. Founded in 1945, CARE is nonsectarian, impartial, and non-governmental. It is one of the largest and oldest humanitarian aid organizations focused on fighting global poverty',
                 bank_account:8
                 )
care_international.user = yuyu
care_international.save!

aflatoun = Ngo.new(name:'Aflatoun',
                 address:'Paseo Jesús de Galindez 0, B7600 Mar del Plata, Buenos Aires',
                 email:'info@aflatoun.org',
                 website:'https://www.aflatoun.org',
                 description:'Aflatoun International is a non-governmental organization focusing on educating children about their rights and responsibilities and managing financial resources through social and financial education. ',
                 bank_account:9)
aflatoun.user = yuyu
aflatoun.save!

global_vision_international_charitable_trust = Ngo.new(name:'Global Vision Internation Chariable Trust',
                 address:'Av. del Libertador, El Calafate, Santa Cruz, Argentina',
                 email:'info@gvi.org',
                 website:'https://gvi.org',
                 description:'1. To relieve sickness and preserve and promote the good health of persons.
                              2. To promote, for the benefit of the public, the conservation, protection and improvement of the physical and natural environment.
                              3. To advance education and research for the benefit of the public in the conservation, protection and improvement of the physical and natural environment.
                              4. To relieve poverty, financial hardship and distress.',
                 bank_account:10)
global_vision_international_charitable_trust.user = orlando
global_vision_international_charitable_trust.save!

habitat_for_humanity = Ngo.new(name:'Habitat for Humanity',
                 address:'Batalla de Cepeda 100, E3280 Colón, Entre Ríos, Argentina',
                 email:'lac@habitat.org',
                 website:'https://www.habitat.org',
                 description:'Habitat for Humanity International, generally referred to as Habitat for Humanity or simply Habitat, is an international, non-governmental, and nonprofit organization, which was founded in 1976 by Linda and Millard Fuller',
                 bank_account:11)
habitat_for_humanity.user = orlando
habitat_for_humanity.save!

# ngo_member
puts 'creating ngo_members'
NgoMember.create!(ngo: manta_ngo, user: pin)
NgoMember.create!(ngo: save_children, user: sam)
NgoMember.create!(ngo: code_for_america, user:sam)
NgoMember.create!(ngo: habitat_for_humanity, user:sam)
NgoMember.create!(ngo: wikimedia_foundation, user: sebas)
NgoMember.create!(ngo: global_vision_international_charitable_trust, user: sebas)
NgoMember.create!(ngo: save_children, user: sebas)

# report
puts 'creating reports'
Report.create!(ngo: manta_ngo, phone_number: '123234234', category: 'something', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris feugiat justo lectus, non aliquam eros accumsan id. Nulla eget odio eget mi semper semper id sed sapien. Etiam commodo diam quis nullam.' )

# publication
puts 'creating publications'
pub_1 = Publication.create!(ngo: wikimedia_foundation,
                    title: 'Teach english',
                    description: "We want someone who can teach english to children in our project every sunday morning for 4 months. There are 15 children and their age is around 10-15 years old.",
                    intended_use: 'In this project, we want our children in suburban area to be able to communicate in English with foreigners, enjoy their class as much as possible and able to inspire them to learn. ',
                    category: 'Services',
                    sub_category: 'Teaching',
                    location: 'Av. Maipú 173, V9410 Ushuaia, Tierra del Fuego, Argentina')

pub_2 = Publication.create!(ngo: wikimedia_foundation,
                    title: 'Creating database',
                    description: 'In our foundation, we want someone who is able to build a website for the project that we are working on which is about refugee. If you are able to build it for us, please let us know',
                    intended_use: 'The refugee project, wikimedia_foundation wants to build a record and status for each person since there are thounsand of them in our basecamp. We might be able to use these data to the research in the future',
                    category: 'Services',
                    sub_category: 'Tech support',
                    location: 'Av. Maipú 173, V9410 Ushuaia, Tierra del Fuego, Argentina')

pub_3 = Publication.create!(ngo: wikimedia_foundation,
                    title: 'Books',
                    description: 'We are building a library to one of the schools in remote area in Ushuaia. We might need the books as much as possible about any topics for 5-18 years old. Having the library for children will increase the literacy rate and enhance the ability to learn in the future.',
                    intended_use: 'Biblioteca para ellos is the project that we create a month ago in order to increase the literacy rate and encourage children to learn more and acquire knowledge. We will build the library next to thier community so that during the weekend or after school, those children can spend time being in the library and are able to learn new things which might be an important skill in the future',
                    category: 'Goods',
                    sub_category: 'Books',
                    location: 'Av. Maipú 173, V9410 Ushuaia, Tierra del Fuego, Argentina')

pub_4 = Publication.create!(ngo: save_children,
                    title: 'Painting the wall',
                    description: 'On August 16th, Save children foundation would like to invite people who are interested in helping us paiting the wall at the houses that we build in Las sierras for underprivileged people. There are 43 houses that we build. We will provide you transportation from Save Children and lunch.',
                    intended_use: 'There are 146 people without home. During the winter especially, it might be hard for those to live outside and some of them have children. We had fund the money for this project and already built houses for them.',
                    category: 'Services',
                    sub_category: 'Art project',
                    location: 'Av. Hipólito Yrigoyen 511, X5004 Córdoba, Argentina')

pub_5 = Publication.create!(ngo: save_children,
                    title: 'Refrigerators',
                    description: 'A month ago, our organization had build 43 houses for underprivileged people and we need 43 refrigerators for them',
                    intended_use: 'Regridgerator is an essential thing to have in each house in order to keep their food fresh and longer. Since we just build houses for underprivileged people. Our main goal is for them to be healthy and have a place where they feel like home',
                    category: 'Goods',
                    sub_category: 'Furniture',
                    location: 'Av. Hipólito Yrigoyen 511, X5004 Córdoba, Argentina')

pub_6 = Publication.create!(ngo: save_children,
                    title: 'Health promotion event for 1 day',
                    description: 'There are many children in our country that has malnutrition. Their social economic status plays an important role in it. However, the campaign that we just launched is about promoting eating habit and having a seminar about how to eat nutritiously for family in suburban area. We need 10 volunteers to help us on administrative work and general purposes',
                    intended_use: 'The purpose of this project wil allow family in suburban area understand more about eating habit, as well as their young children. They might be able to understand more and take care their children consciously when it comes to eating habit. It may help those children to have a healthy eating habit in the long term',
                    category: 'Services',
                    sub_category: 'General volunteer',
                    location: 'Av. Hipólito Yrigoyen 511, X5004 Córdoba, Argentina')

pub_7 = Publication.create!(ngo: cambia,
                    title: '15 footballs',
                    description: 'In school building project of Cambia foundation, we need 15 footballs for students to maintain their healthy lifestlye.',
                    intended_use: '3 months ago, we had build a school outside of Mendoza. There are 100 children that have no education and our mission is to make sure that those children are able to go to school and access their education easier. Hence, we build the school inside the community and help them to be able to go to school and have a brighter future. Having footballs in school will allow them to be relaxed after school or during the break and promote their healthy lifestyle. ',
                    category: 'Goods',
                    sub_category: 'Sporting goods',
                    location: 'Av. del Libertador 4400, M5500 Mendoza, Argentina')

pub_8 = Publication.create!(ngo: cambia,
                    title: '10,000 dollars',
                    description: 'In Cambia Mendoze project, we are funding the money in order to build a shelter for refugee who have come to Mendoza more than 1,000 people so that they have place to stay and we are able to take care of them',
                    intended_use: 'Having a place to stay is one of the basic needs for human, there are more than 1,000 refugees right now in Mendoza and they have no place to stay. However, we are funding the money in order to build a shelter for them and to make sure that they are safe. Our team will provide them basic needs and we may have some crucial activities in the near future',
                    category: 'Donate',
                    sub_category: '-',
                    location: 'Av. del Libertador 4400, M5500 Mendoza, Argentina')

pub_9 = Publication.create!(ngo: cambia,
                    title: '43 computers',
                    description: 'Technology nowadays plays an important role to everyone. We had build a school for children and need 43 computers for them to use in the school.',
                    intended_use: 'Computer skill in last century is the most important skill for everyone. Children will have the opportunity to learn them in school and able to use this skill in their jobs in the future. As well as, computers will be a source for them to search and learn new things in the internet world. It also helps them to connect with the outside world. Children will have more tools to learn and enjoy their learning journey.',
                    category: 'Goods',
                    sub_category: 'Electronic',
                    location: 'Av. del Libertador 4400, M5500 Mendoza, Argentina')

pub_10 = Publication.create!(ngo: barefoot_college,
                    title: '3,000 dollars',
                    description: 'There are 205 homeless dogs in Tucumán. We are planning to build a shelter for them all and make sure that they are safe',
                    intended_use: 'Tucumán is one of the cities that has many dogs along the street. In order to for them to have a palce to stay, we decided to built a shelter. This shelter might be able to decrease the amount of people whom got bitten from street dogs as well.',
                    category: 'Donate',
                    sub_category: '-',
                    location: 'Congreso de Tucumán 141, T4000IEC San Miguel de Tucumán, Argentina')

pub_11 = Publication.create!(ngo: barefoot_college,
                   title: 'Clothes',
                    description: 'Season is changing and your clothes from last year may not fit. If you notice clothes piling up in your family’s closets — and you’re looking for a way to help the less fortunate — donating clothes could be a super-easy start. Throughout the year, we collect all kinds of summer and winter clothes for children and adults at our centre. ',
                    intended_use: 'A small gesture of yours will be a boon for poverty stricken, deprived people to stay happy during the cruel summer / winter season. So, show your generosity, and help us to collect as many as clothes to keep the deprived ones comfortable in harsh summers and winters.',
                    category: 'Goods',
                    sub_category: 'Clothes',
                    location: 'Congreso de Tucumán 141, T4000IEC San Miguel de Tucumán, Argentina')

pub_12 = Publication.create!(ngo: barefoot_college,
                    title: 'Kitchenware needed!',
                    description: 'We are building another centre for our foundation in Salta. However, we need some Kitchenware for our centre so that we can cook properly',
                    intended_use: 'In order to have kitchenware to cook in our centre and we are able to share the food to others. During the weekend, we normally have the food charity as well',
                    category: 'Goods',
                    sub_category: 'Kitchenware',
                    location: 'Congreso de Tucumán 141, T4000IEC San Miguel de Tucumán, Argentina')
pub_13 = Publication.create!(ngo: code_for_america,
                    title: '5,000 dollars',
                    description: 'We are funding the project to help children learn how to code more and will make sure that they can implement the skill in the future.',
                    intended_use: 'Coding skill is another crucial skill these days. It is another universal language for our new age. This skill not only will help them learn how to build thing on the system, but also help them having a structure thought. This skill will enhance their thinking process and learning skill',
                    category: 'Donate',
                    sub_category: '-',
                    location: 'España 558, A4400 Salta, Argentina')

pub_14 = Publication.create!(ngo: code_for_america,
                    title: '5 laptops',
                    description: 'We need 5 laptops in our centre to teach students every saturday for people who are interested in coding.' ,
                    intended_use: 'Using for teaching people who want to learn how to code and make sure that they are learning this skill efficiently. They might be able to change or find their jobs in the future too. ',
                    category: 'Goods',
                    sub_category: 'Electronic',
                    location: 'España 558, A4400 Salta, Argentina')

pub_15 = Publication.create!(ngo: code_for_america,
                     title: 'Teach coding',
                    description: 'We are finding people who have a strong programming knowledge and want to teach general people who want to learn how to code. Volunteer may need to be patient and willing to explain coding logic easily',
                    intended_use: 'Coding skill is another crucial skill these days. If you are a programmer or having a programming background, you may find this volunteering opportunity interesting. You will help other people understand more about programming world and may be able to help them change their life.',
                    category: 'Services',
                    sub_category: 'Teaching',
                    location: 'España 558, A4400 Salta, Argentina')
pub_16 = Publication.create!(ngo: human_rights_watch,
                    title:'10 whiteboards',
                    description: 'We are having a new program for promoting awareness for discrimination and inequality in women. We need 10 whiteboards in our centre when we have seminars and need them to brainstorm in a group',
                    intended_use: 'This program will enhance the knowledge of discrimination and inequality which can occur in different ways. Discrimination can occur directly,
                    as when a law or policy restricts, prefers or unjustifiably distinguishes between certain
                    groups and help women having their awareness',
                    category: 'Goods',
                    sub_category: 'Furniture',
                    location: 'Av. Roque Perez, Posadas, Argentina')

pub_17 = Publication.create!(ngo: human_rights_watch,
                     title: '4,200 dollars',
                    description: 'Posadas Flood Relief Fund, More than a million people effected by severe flooding. Recent floods in Posadas killed 64 people.',
                    intended_use: 'This fund will provide relief to survivors in the form of emergency supplies like food, water and medicine. In addition to longer-term recovery assistance to help residents recover and rebuild. All donations to this fund will exclusively support flood and monsoon relief and recovery efforts throughtout the region',
                    category: 'Donate',
                    sub_category: '-',
                    location: 'Av. Roque Perez, Posadas, Argentina')

pub_18 = Publication.create!(ngo: human_rights_watch,
                    title: 'Tech support volunteer',
                    description: 'We believe that by providing a low-income family or individual with a ready-to-use computer can help them achieve their goals of job search, career advancement, education, or life improvement. Every sunday, we will go visit each house to help them with their computer or internet or fixing donated computers to be ready to use for people.',
                    intended_use: 'Our hope is to keep seniors, students and the disabled connected to the resources, opportunities and community through technology',
                    category: 'Services',
                    sub_category: 'Tech support',
                    location: 'Av. Roque Perez, Posadas, Argentina')
pub_19 = Publication.create!(ngo: care_international,
                   title: 'Sport apparel and footwear',
                    description: 'we want to give all kids the lifelong benefits of sport and physical activity by providing equipment, apparel and footwear to those most in need.',
                    intended_use: 'We are promoting all kids to have a healthy lifestyle. In the project, we will donate all of sporting goods in rural area of Argentina.',
                    category: 'Goods',
                    sub_category: 'Sporting goods',
                    location: 'Pelagio B. Luna 811, F5300 La Rioja, Argentina')

pub_20 = Publication.create!(ngo: care_international,
                    title: '2,400 dollars',
                    description: 'The care international sends donated medical supplies to people who need it in Argentina. This project will buy new wigs, walking aids and weelchairs.',
                    intended_use: 'The project will send medical supplies to people who needed. We will connect with the hospital and select people according to the criteria we have. If you want to know the further information, you can contact us in the profile.',
                    category: 'Donate',
                    sub_category: '-',
                    location: 'Pelagio B. Luna 811, F5300 La Rioja, Argentina')

pub_21 = Publication.create!(ngo: care_international,
                    title: 'Book donations',
                    description: 'Care internation foundation has created a project which will donate books to the hospital for people who has a chronic disease and need to stay in the hospital for a long time',
                    intended_use: "Patients in the hospital are able to access to books more and read them during their free time. It's not only will help them kill their free time, but also help them enhance their knowledge and keep learning.",
                    category: 'Goods ',
                    sub_category: 'Books',
                    location: 'Pelagio B. Luna 811, F5300 La Rioja, Argentina')
pub_22 = Publication.create!(ngo: aflatoun,
                     title: 'Teaching math',
                    description: 'At Aflatoun organization, we are having after school program to teach math for students who are interested in learning Math and want to go further.',
                    intended_use: 'After school class is a choice for students. For those who are interested in learning math, they are able to go further. They will have an opportunity to learn from the profession and learn math in an alternative way.',
                    category: 'Services',
                    sub_category: 'Teaching',
                    location: 'Paseo Jesús de Galindez 0, B7600 Mar del Plata, Buenos Aires')

pub_23 = Publication.create!(ngo: aflatoun,
                    title: '14,000 dollars',
                    description: 'In Argentina, some children come from poor families. Girls are at the greatest risk of dropping out. Four-year leadership development program for primary school and secondary girls studying in the informal schools in Argentina. This project will target girls, who are most at risk due to academic challenges, and provide them with holistic support daily after school.',
                    intended_use: " Only 45 percents of girls attend school. Scholarship programs understandably, target the brightest and the best. But this means that girls under-performing in school, often through no fault of their own, find their only options are child marriage, prostitution or sexual exploitation. Child marriage accounts for 5 percents of primary school dropouts and child pregnancy for a horrifying 40%. Child pregnancy has appalling mother and baby mortality rates",
                    category: 'Donate',
                    sub_category: '-',
                    location: 'Paseo Jesús de Galindez 0, B7600 Mar del Plata, Buenos Aires')

pub_24 = Publication.create!(ngo: aflatoun,
                    title: 'Cloth donation',
                    description: "Aflatoun serves babies around the world living in devastatingly difficult situations, where sometimes a choice has to be made between food and cloths. We will donate cloth at orphanages",
                    intended_use: 'We will donate at the orphanages center. Clothes will provide a long-term solution from birth, truly changing the lives of these children.',
                    category: 'Goods',
                    sub_category: 'Clothes',
                    location: 'Paseo Jesús de Galindez 0, B7600 Mar del Plata, Buenos Aires')
pub_25 = Publication.create!(ngo: global_vision_international_charitable_trust,
                    title: 'Books donation for children in rural area',
                    description: 'There are many underprivileged kids in Argentina and illiteracy rate is increasing. We are building a library in the community in order for children to access library easier and having fun learning from the book ',
                    intended_use: 'This project will help those children enjoy learning and reading. Including the library will be a place for them to meet others and discuss about books',
                    category: 'Goods',
                    sub_category: 'Books',
                    location: 'Av. del Libertador, El Calafate, Santa Cruz, Argentina')

pub_26 = Publication.create!(ngo: global_vision_international_charitable_trust,
                    title: '14 couches',
                    description: 'In Glbal Vision Internation Charitawble Trust foundation, we want 14 couches in our centre since we are expanding and will be able to hold a bigger project and seminars in various projects that we will have in the future  ',
                    intended_use: 'We will use the couch in order to have in centre and will help participants feel comfortable and are able to learn various topic that it will be held in the centre.',
                    category: 'Goods',
                    sub_category: 'Furniture',
                    location: 'Av. del Libertador, El Calafate, Santa Cruz, Argentina')

pub_27 = Publication.create!(ngo: global_vision_international_charitable_trust,
                    title: 'Toys for children',
                    description: 'In our foundation, we are receiving toys so that we can donate to children who need it in Rosario. We will target with the family who has young children and has low income.',
                    intended_use: 'Toys are important for children to learn and aids them to have the right development. They are able to play with them and will improve their development such as motor development skill, social skill and fine motor skill',
                    category: 'Goods',
                    sub_category: 'Toys',
                    location: 'Av. del Libertador, El Calafate, Santa Cruz, Argentina')
pub_28 = Publication.create!(ngo: habitat_for_humanity,
                    title: 'Painting with elder people',
                    description: 'We want 10 volunteers to help us with the project on August, 25th. It will be held at the elderly care center.',
                    intended_use: 'This project will be able to help elerly people to have a great time and enjoy doing activity with other people. They will have a chance to contact other people from outside who are cheerful and happy.',
                    category: 'Services',
                    sub_category: 'Art project',
                    location: 'Batalla de Cepeda 100, E3280 Colón, Entre Ríos, Argentina')

pub_29 = Publication.create!(ngo: habitat_for_humanity,
                    title: 'Teaching marketing',
                    description: 'Marketing skill is important for people who are interested in bussiness. This project will target students who are in high school and want to learn the marketing skill so that they can use in their job. We need 3 volunteers in every friday afternoon from 4-6pm',
                    intended_use: 'Teaching students to have marketing skill and are able to use this skill in their job or future project.',
                    category: 'Services',
                    sub_category: 'Teaching',
                    location: 'Batalla de Cepeda 100, E3280 Colón, Entre Ríos, Argentina')

pub_30 = Publication.create!(ngo: habitat_for_humanity,
                    title: 'Office supplies needed',
                    description: 'Currently, we are having a project called "Saturday school" where volunteers come to teach students in various subjects. We need various office supplies, for example: papers, pens, pencils, colour pencils. ',
                    intended_use: 'We will used these supplies in the project every saturday. It will be tools for students to learn efficiently and effectively.',
                    category: 'Goods',
                    sub_category: 'Office supplies',
                    location: 'Batalla de Cepeda 100, E3280 Colón, Entre Ríos, Argentina')


# offer
puts 'creating offers'
offer1 = Offer.create!(user: orlando, publication: pub_1 )
offer2 = Offer.create!(user: orlando, publication: pub_2)
offer3 = Offer.create!(user: fer, publication: pub_3)
offer4 = Offer.create!(user: remi, publication: pub_3)
offer5 = Offer.create!(user: gerardo, publication: pub_3)


# message
puts 'creating messages'
Message.create!(user: orlando, offer: offer1, content: 'somme content')

# pictures
# puts 'creating pictures'
