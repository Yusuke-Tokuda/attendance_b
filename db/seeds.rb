User.create!(name: "ラスボス",
             email: "sample@email.com",
             employee_number: 1001,
             password: "password",
             password_confirmation: "password",
             department: "魔王軍",
             admin: true)

User.create!(name: "ボス",
             email: "senior-1@email.com",
             employee_number: 1002,
             password: "password",
             password_confirmation: "password",
             department: "魔王軍",
             senior: true)

User.create!(name: "中ボス",
             email: "senior-2@email.com",
             employee_number: 1003,
             password: "password",
             password_confirmation: "password",
             department: "魔王軍",
             senior: true)

47.times do |n|
  name  = Faker::Name.name  
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