# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tag1 = Label.create(title: 'Wi-fi', icon: 'fa-solid fa-wifi')
tag2 = Label.create(title: 'Parking', icon: 'fa-solid fa-square-parking')
tag3 = Label.create(title: 'Spa', icon: 'fa-solid fa-spa')
tag4 = Label.create(title: 'Gym', icon: 'fa-solid fa-dumbbell')
tag5 = Label.create(title: 'Pets', icon: 'fa-solid fa-paw')

Hotel.delete_all

hotel = Hotel.create(name: 'Hilton',
                     description: 'Cozy rooms in a modern hotel with a rooftop restaurant and lounge, as well as an indoor pool and spa.', 
                     address: 'Pobřežní 311/1', 
                     city: 'Praha', 
                     user_id: 1)
room = Room.create(name: 'For two person',
                   price: 130,
                   square: 50,
                   capacity: 2,
                   count: 5,
                   double_bed: 1,
                   hotel_id: 1)
