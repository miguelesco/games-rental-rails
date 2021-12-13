# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    username: 'Joao',
  },
  {
    username: 'Maria',
  },
  {
    username: 'Pedro',
  },
]

User.create(users)

games = [
  {
    name: 'Super Mario Bros',
    category: 'Platformer',
    price: 20,
    description: 'Super Mario Bros is a platform video game series created by Nintendo EAD and published by Nintendo for the Nintendo Entertainment System (NES) console.',
    icon: 'sanbsjasa.png',
    owner_id: 1,
  },
  {
    name: 'Super Mario Bros 2',
    category: 'Platformer',
    price: 20,
    description: 'Super Mario Bros 2 is a platform video game series created by Nintendo EAD and published by Nintendo for the Nintendo Entertainment System (NES) console.',
    icon: 'sanbsjasa.png',
    owner_id: 3,
  },
]

Game.create(games)

reservation = {
  reservation_date: '2020-01-01',
  retrieval_date: '2020-01-03',
  location: 'São Paulo',
  buyer_id: 2,
  game_id: 1,
}

Reservation.create(reservation)

