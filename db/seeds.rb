# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Product.destroy_all
User.destroy_all
owner = User.create!(email: "owner@owner.com", password: "123456")
client = User.create!(email: "user@user.com", password: "123456")
file1 = URI.open("https://img.irroba.com.br/fit-in/900x700/filters:format(webp):fill(fff):quality(80)/levbaaia/catalog/e-bike/ebike-preta-lado-alta.jpg")
product1 = Product.new(model: "E-BIKE Lev", description: 'Moto bonita', price: 1500, location: "Rio de Janeiro", category: "E-Bike", user: owner)
product1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
product1.save!
file2 = URI.open("https://c0.klipartz.com/pngpicture/950/505/gratis-png-tesla.png")
product2 = Product.new(model: "Tesla", description: 'Moto bonita', price: 15000, location: "London", category: "Electric Car", user: owner)
product2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
product2.save!
file3 = URI.open("https://img.irroba.com.br/fit-in/900x700/filters:format(webp):fill(fff):quality(80)/levbaaia/catalog/api/app-12641/64a62f2791643.jpg")
product3 = Product.new(model: "E-BIKE S", description: 'Moto bonita', price: 2500, location: "Lisbon", category: "E-Bike", user: owner)
product3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
product3.save!
file4 = URI.open("https://www.cycleworld.com/resizer/1WiJPIvuxJnCdmNDS6p3J82QITo=/1440x0/filters:focal(746x550:756x560)/cloudfront-us-east-1.images.arcpublishing.com/octane/SAF4JLU75VGZVOTE623BBJTCSE.jpg")
product4 = Product.new(model: "Cake Makka", description: 'Moto bonita', price: 6500, location: "São Paulo", category: "E-Motorbike", user: owner)
product4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
product4.save!
