# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.delete_all
Flight.delete_all

airports = Airport.create([{
  name:    "Chubu Centrair International Airport",
  code:    "NGO",
  city:    "Nagoya",
  state:   "Aichi",
  country: "Japan"
},
  {
    name:    "Jorge Chávez International Airport",
    code:    "LIM",
    city:    "Callao",
    state:   "Lima",
    country: "Peru"
  },
  {
    name:    "Barcelona–El Prat Airport",
    code:    "BCN",
    city:    "Barcelona",
    state:   "Catalonia",
    country: "Spain"
  },
  {
    name:    "New York John F. Kennedy International Airport",
    code:    "NYC",
    city:    "New York City,",
    state:   "New York",
    country: "United States"
  },
  {
    name:    "San Francisco International Airport",
    code:    "SFO",
    city:    "San Francisco",
    state:   "California",
    country: "United States"
  }])

15.times do |f|
  dep, arr = Airport.pluck(:id).sample(2)

  Flight.create(departure_airport: dep,
    arrival_airport: arr,
    departure_time: rand(DateTime.current..1.years.from_now),
    duration: rand(24.hours))
end
