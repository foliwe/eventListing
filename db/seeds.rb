require 'faker'

4.times do
  User.create!(
    name:Faker::Name.name,
    email:Faker::Internet.safe_email,
    password: "123456",
    password_confirmation: "123456",
  )
end
 
    User.create!(
      name: "Foliwe Fossung",
      email: "foliwe@example.com",
      admin: 1,
      password: "123456",
      password_confirmation: "123456",
    )

    User.create!(
      name: "Patrick Fossung",
      email: "patrick@example.com",
      password: "123456",
      password_confirmation: "123456",
    )

    User.create!(
      name: "Akuma Fossung",
      email: "akuma@example.com",
      password: "123456",
      password_confirmation: "123456",
    )

HOW_HEARD_OPTIONS = [
  'Newsletter',
  'Blog Post',
  'Twitter',
  'Web Search',
  'Friends/Coworker',
  'Other'
]

categories = [
  'Free Food',
  'Fundraiser',
  'Afrocentrism',
  'PanAfricanism',
  'Coding',
  'White Supremacy'
]

location = [
  'Kumba Mbeng',
  'Buea Molyko',
  'Limbe Down Beach',
  'Douala Central',
  'Ebolowa',
  'Bamenda',
  'Tiko golf club',
  'Yaounde Capital'
]

categories.each{ |name| Category.create!(name: name) }



10.times do 
  Event.create!(name:Faker::Artist.name,
     location: location.sample,
     capacity: rand(1..50),
     category_ids: [1, 2, 3, 4, 5, 6].sample(rand(1..3)),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.forward(days: 23, period: :morning),
     price:Faker::Number.decimal_part(digits: 2)
    )
end


6.times do 
  Event.create!(name:Faker::Artist.name,
    location: location.sample,
     capacity: rand(1..10),
     category_ids: [1, 2, 3, 4, 5, 6].sample(rand(1..2)),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.forward(days: 100, period: :morning),
     price: 0.0
    )
end

20.times do 
  Event.create!(name:Faker::Artist.name, 
     location: location.sample,
     capacity: rand(1..11),
     category_ids: [1, 2, 3, 4, 5, 6].sample(rand(1..3)),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.backward(days: 60, period: :evening),
     price:Faker::Number.decimal_part(digits: 2)
    )
end

20.times do 
  Like.create!(
    event_id: rand(1..26),
    user_id: rand(1..7)
  )
end

    20.times do 
      Registration.create!(
         user_id:rand(1..7),
         event_id: rand(1..20),
         how_heard: HOW_HEARD_OPTIONS.sample
        )
    end