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
    name: 'Sekiro',
    category: 'Souls-Like',
    price: 59,
    description: 'Game of the Year - The Game Awards 2019 Best Action Game of 2019 - 
    IGN Carve your own clever path to vengeance in the award 
    winning adventure from developer FromSoftware, creators of Bloodborne 
    and the Dark Souls series. Take Revenge. Restore Your Honor. Kill Ingeniously.',
    icon: 'sanbsjasa.png',
    owner_id: 3,
  },
  {
    name: 'Fall Guys',
    category: 'Party game',
    price: 38,
    description: 'Fall Guys is a massively multiplayer 
    party game with up to 60 players online in a free-for-all 
    struggle through round after round of escalating chaos until one victor remains!',
    owner_id: 3,
  },
  {
    name: 'Resident Evil Village',
    category: 'Party game',
    price: 99,
    description: 'Experience survival horror like never before in 
    the 8th major installment in the Resident Evil franchise - Resident 
    Evil Village. With detailed graphics, intense first-person action and 
    masterful storytelling, the terror has never felt more realistic.',
    owner_id: 1,
  },
  {
    name: 'Dying Light',
    category: 'Zombies',
    price: 55,
    description: 'First-person action survival game set in a post-apocalyptic open 
    world overrun by flesh-hungry zombies. Roam a city 
    devastated by a mysterious virus epidemic. Scavenge for supplies, 
    craft weapons, and face hordes of the infected.',
    owner_id: 2,
  },
]

Game.create(games)

reservations = [
  {
  reservation_date: '2020-01-01',
  retrieval_date: '2020-01-03',
  location: 'São Paulo',
  buyer_id: 2,
  game_id: 1,
  },
  {
    reservation_date: '2020-01-01',
    retrieval_date: '2020-01-03',
    location: 'Berlim',
    buyer_id: 3,
    game_id: 5,
  },
  {
    reservation_date: '2020-01-01',
    retrieval_date: '2020-01-03',
    location: 'Ciudad del lest',
    buyer_id: 1,
    game_id: 2,
  },
  {
    reservation_date: '2020-01-01',
    retrieval_date: '2020-01-03',
    location: 'Mexico',
    buyer_id: 1,
    game_id: 3,
  },
  {
    reservation_date: '2020-01-01',
    retrieval_date: '2020-01-03',
    location: 'London',
    buyer_id: 2,
    game_id: 4,
  },
]

Reservation.create(reservation)

