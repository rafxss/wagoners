# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts("Creating User")

# Create Users
User.create(first_name: 'Espaniol', 
            last_name: 'de Espania', 
            email: 'spain@spain.com', 
            password: '12345678', 
            password_confirmation: '12345678', 
            address: 'Calle de Cenicero, Madrid', 
            date_of_birth: '1996-11-20')

sleep(8)

puts("User created")
puts("#########################")

puts("Creating Partners")

# ["id", "name", "phone", "email", "created_at", "updated_at", "description"]
business1 = Partner.create(name: 'business1',
              phone: '511111111',
              email: 'b1@bbva.com',
              description: 'business 01')

business2 = Partner.create(name: 'business2',
              phone: '511111111',
              email: 'b2@bbva.com',
              description: 'business 02')

business3 = Partner.create(name: 'business3',
              phone: '511111111',
              email: 'b3@bbva.com',
              description: 'business 03')

puts("Partners created")
puts("#########################")

puts("Creating branches")

# ["id", "address", "latitude", "longitude", "partner_id", "email", "phone", "created_at", "updated_at"]
BranchOffice.create(address: 'Calle de Atocha 110, Madrid',
                    email: 'b1@bbva.com',
                    phone: '5111111-1',
                    partner_id: business1.id)

sleep(8)

BranchOffice.create(address: 'Calle de Atocha 118, Madrid',
                    email: 'b2@bbva.com',
                    phone: '5111111-2',
                    partner_id: business2.id)

sleep(8)

BranchOffice.create(address: 'Calle de Atocha 120, Madrid',
                    email: 'b3@bbva.com',
                    phone: '5111111-3',
                    partner_id: business3.id)

sleep(8)

BranchOffice.create(address: 'Calle del Dr. Drumen 4, Madrid',
                    email: 'b1@bbva.com',
                    phone: '5111111-4',
                    partner_id: business1.id)

puts("Branches created")

# BranchOffice.near([User.first.latitude, User.first.longitude], 5, unit: :km)