# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
CSV.foreach('db/genres.csv') do |row|
  Genre.create(:name => row[0])
end

CSV.foreach('db/priceranges.csv') do |row|
  Pricerange.create(:price => row[0])
end

CSV.foreach("db/prefectures.csv") do |row|
  Address.create(:prefectures => row[0])
end

10.times do |i|
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8),
    age: (20..40).to_a.sample,
    sex: %w[男性 女性].sample,
    address_id: (1..47).to_a.sample,
  )
  (0..20).to_a.sample.times do |i|
    Shop.create(
      name: Faker::Company.name,
      user_id: user.id,
      title: Faker::Company.industry,
      description: Faker::Company.catch_phrase,
      genre_id: (1..14).to_a.sample,
      pricerange_id: (1..11).to_a.sample,
      address_id: (1..47).to_a.sample,
    )
  end
end


