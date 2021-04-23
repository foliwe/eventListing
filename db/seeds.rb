require 'faker'

HOW_HEARD_OPTIONS = [
  'Newsletter',
  'Blog Post',
  'Twitter',
  'Web Search',
  'Friends/Coworker',
  'Other'
]

7.times do 
  Event.create!(name:Faker::Artist.name,
     location:Faker::Address.street_name,
     capacity: rand(1..10),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.forward(days: 23, period: :morning),
     price:Faker::Number.decimal_part(digits: 2)
    )
end


3.times do 
  Event.create!(name:Faker::Artist.name,
     location:Faker::Address.street_name,
     capacity: rand(1..30),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.forward(days: 100, period: :morning),
     price: 0.0
    )
end

4.times do 
  Event.create!(name:Faker::Artist.name,
     location:Faker::Address.street_name,
     capacity: rand(1..11),
     description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
     starts_at: Faker::Time.backward(days: 60, period: :evening),
     price:Faker::Number.decimal_part(digits: 2)
    )
end

20.times do 
  Registration.create!(
     name:Faker::Name.name,
     email:Faker::Internet.safe_email,
     event_id: rand(1..14),
     how_heard: HOW_HEARD_OPTIONS.sample
    )
end


4.times do
  User.create!(
    name:Faker::Name.name,
    email:Faker::Internet.safe_email,
    password: "123456",
    admin: 0,
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
