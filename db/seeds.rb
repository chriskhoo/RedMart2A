User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

Category.create!(name: "Bread")
Category.create!(name: "Rice/Noodles/Pastas")
Category.create!(name: "Snacks")
Category.create!(name: "Beer")

Product.create!(name: "Sunshine", category_id: 1)
Product.create!(name: "Gardenia", category_id: 1)
Product.create!(name: "San Remo Instant Spaghetti, 500g", category_id: 2)
Product.create!(name: "San Remo Macaroni Elbow, 500g", category_id: 2)
Product.create!(name: "Calbee Jagabee Seaweed, 17g x 5'P", category_id: 3)
Product.create!(name: "Calbee Jagabee Purple Potato, 17g x 5'P", category_id: 3)

40.times do |n|
Product.create!(name:  Faker::Beer.name,
                category_id: 4)
end
