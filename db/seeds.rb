# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hotel = Hotel.create(name: "Prague Marriott Hotel", 
                  address: "V Celnici 8, 110 00 Nové Město", 
                  description: "A minute's walk from the metro station and 2.7 km from Prague City.",
                   city: "Praha, Hlavne Mesto");

room1 = Room.create(name:"Two single bed",price:400, square: 56, count: 4, single_bed: 2)
room2 = Room.create(name:"Two single bed",price:120, square: 36, count: 2, single_bed: 1)
hotel.rooms << room1
hotel.rooms << room2
tag1 = Label.create(title: "Wi-fi");
tag2 = Label.create(title: "Parking")
hotel.labels << tag1
hotel.labels << tag2

hotel2 = Hotel.create(name: "Hotel Lviv", 
    address: "Stometrivka", 
    description: "Alko dvizh.",
     city: "Lviv");

room3 = Room.create(name:"Double bed",price:445, square: 56, count: 4, double_bed: 1)
room4 = Room.create(name:"Two single bed",price:1135, square: 106, count: 1, single_bed: 1)
hotel2.rooms << room3
hotel2.rooms << room4

tag3 = Label.create(title: "Wi-fi");
tag4 = Label.create(title: "Parking")
hotel2.labels << tag3
hotel2.labels << tag4