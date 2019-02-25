# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@example.com', admin: true, password: '1234567890')

Product.create([
  { name: 'Apple Green', original_price: 100, discount_price: 80, image: Rails.root.join("tmp/images/apple-green.png").open },
  { name: 'Avocado Sliced', original_price: 80, discount_price: 75, image: Rails.root.join("tmp/images/avocado-sliced.jpg").open },
  { name: 'Kiwi', original_price: 15, discount_price: 10, image: Rails.root.join("tmp/images/kiwi.jpg").open },
  { name: 'Orange', original_price: 5, discount_price: 4, image: Rails.root.join("tmp/images/Oranges.jpg").open },
  { name: 'Apple Green', original_price: 100, discount_price: 80, image: Rails.root.join("tmp/images/apple-green.png").open },
  { name: 'Avocado Sliced', original_price: 80, discount_price: 75, image: Rails.root.join("tmp/images/avocado-sliced.jpg").open },
  { name: 'Kiwi', original_price: 15, discount_price: 10, image: Rails.root.join("tmp/images/kiwi.jpg").open },
  { name: 'Orange', original_price: 5, discount_price: 4, image: Rails.root.join("tmp/images/Oranges.jpg").open },
  { name: 'Apple Green', original_price: 100, discount_price: 80, image: Rails.root.join("tmp/images/apple-green.png").open },
  { name: 'Avocado Sliced', original_price: 80, discount_price: 75, image: Rails.root.join("tmp/images/avocado-sliced.jpg").open },
  { name: 'Kiwi', original_price: 15, discount_price: 10, image: Rails.root.join("tmp/images/kiwi.jpg").open },
  { name: 'Orange', original_price: 5, discount_price: 4, image: Rails.root.join("tmp/images/Oranges.jpg").open },
  { name: 'Apple Green', original_price: 100, discount_price: 80, image: Rails.root.join("tmp/images/apple-green.png").open },
  { name: 'Avocado Sliced', original_price: 80, discount_price: 75, image: Rails.root.join("tmp/images/avocado-sliced.jpg").open },
  { name: 'Kiwi', original_price: 15, discount_price: 10, image: Rails.root.join("tmp/images/kiwi.jpg").open },
  { name: 'Orange', original_price: 5, discount_price: 4, image: Rails.root.join("tmp/images/Oranges.jpg").open },
])
