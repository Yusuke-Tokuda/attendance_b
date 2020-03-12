User.create!(name: "ムツゴロウ御大",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             department: "セクシーコマンドー部",
             admin: true)

89.times do |n|
  name  = Faker::Creature::Animal.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end