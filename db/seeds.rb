# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless AdminUser.find_by(email: 'admin@example.com')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
Exchange.where(name: 'Bitstamp', api_url: 'https://www.bitstamp.net/api/ticker/').first_or_create
Exchange.where(name: 'Bitfinex', api_url: 'https://api.bitfinex.com/v1/').first_or_create
Exchange.where(name: 'Coinbase', api_url: 'https://api.coinbase.com/v2/').first_or_create
