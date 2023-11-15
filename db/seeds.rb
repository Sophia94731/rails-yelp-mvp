# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Faker::Config.locale = 'fr'

puts "Reseting the DB..."

Restaurant.destroy_all

puts "Generating 5 restaurants..."

5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: "chinese",
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code
  )
end

puts "The 5 restaurants have been generated"
