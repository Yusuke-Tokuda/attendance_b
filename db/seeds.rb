User.create!(name: "マシリト",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             department: "編集部",
             admin: true)

39.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end