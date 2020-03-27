User.create!(name: "マシリト",
             email: "sample@email.com",
             employee_number: 1,
             password: "password",
             password_confirmation: "password",
             department: "編集部",
             admin: true)

User.create!(name: "鳥山明",
             email: "senior-1@email.com",
             employee_number: 2,
             password: "password",
             password_confirmation: "password",
             department: "編集部",
             senior: true)

User.create!(name: "野沢雅子",
             email: "senior-2@email.com",
             employee_number: 3,
             password: "password",
             password_confirmation: "password",
             department: "太田プロ",
             senior: true)

47.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character
  email = "sample-#{n+1}@email.com"
  employee_number = (n +4),
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end