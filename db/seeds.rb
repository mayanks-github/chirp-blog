5.times do
  user = User.create!(
    email: Faker::Internet.email,
    number: Faker::PhoneNumber.phone_number,
    password: 'password'
  )

  20.times do
    user.blogs.create!(
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraphs.join("\n")
    )
  end
end
