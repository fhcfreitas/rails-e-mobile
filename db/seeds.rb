# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

owner = User.create(email: "owner@owner.com", password: "123456")
User.create(email: "user@user.com", password: "123456")
Product.create(model: "E-bike Cruiser", price: 150, location: "Rio de Janeiro", category: "Bike", user: owner)
Product.create(model: "E-BIKE S", price: 180, location: "Lisbon", category: "Bike", user: owner)
Product.create(model: "Branded Fiat 500", price: 399, location: "Berlim", category: "car", user: owner)
