# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'faker'

puts "Cleaning database..."
# User.destroy_all

puts "Cleaning Offer Table..."
Offer.destroy_all

puts "Cleaning Partner Table..."
Partner.destroy_all

puts "creating partner"
Partner.create(name: "Mercadona", phone: "42525", email:"u@gmail.com")


puts "creating offers"
