User.create!(name: "鳥山明",
             email: "sample@email.com",
             affiliation: "漫画家",
             employee_number: 1001,
             uid: "RX-0",
             password: "password",
             password_confirmation: "password",
             admin: true)

User.create!(name: "フリーザ様",
             email: "superior-1@email.com",
             affiliation: "フリーザ軍",
             employee_number: 1002,
             uid: "ACfa",
             password: "password",
             password_confirmation: "password",
             superior: true)

User.create!(name: "野沢雅子",
             email: "superior-2@email.com",
             affiliation: "太田プロ",
             employee_number: 1003,
             uid: "ACVD",
             password: "password",
             password_confirmation: "password",
             superior: true)

17.times do |n|
  name  = Faker::JapaneseMedia::DragonBall.character 
  email = "sample-#{n+1}@email.com"
  employee_number = n+1004
  uid = "MS-0#{n}"
  password = "password"
  User.create!(name: name,
               email: email,
               employee_number: employee_number,
               uid: uid,
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