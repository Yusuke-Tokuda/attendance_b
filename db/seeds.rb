User.create!(name: "鳥山明",
             email: "sample@email.com",
             employee_number: 1001,
             password: "password",
             password_confirmation: "password",
             affiliation: "漫画家",
             admin: true)

User.create!(name: "フリーザ様",
             email: "superior-1@email.com",
             employee_number: 1002,
             password: "password",
             password_confirmation: "password",
             affiliation: "フリーザ軍",
             superior: true)

User.create!(name: "野沢雅子",
             email: "superior-2@email.com",
             employee_number: 1003,
             password: "password",
             password_confirmation: "password",
             affiliation: "太田プロ",
             superior: true)

17.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character 
  email = "sample-#{n+1}@email.com"
  employee_number = n+1004
  password = "password"
  User.create!(name: name,
               email: email,
               employee_number: employee_number,
               password: password,
               password_confirmation: password)
end

7.times do |n|
  name  =  Faker::Space.star 
  base_number = "FX0#{n}"
  base_type = Faker::Books::Lovecraft.word
  Base.create!(name: name,
               base_number: base_number,
               base_type: base_type)
end