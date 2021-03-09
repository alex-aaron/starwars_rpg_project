# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user1 = User.create(username: "Alex", email: "alex@gmail.com", password: "1894", awards_name: "Ten Years Later Awards")
user2 = User.create(username: "Steph", email: "steph@gmail.com", password: "password", awards_name: "Stephies")
user3 = User.create(username: "Bethany", email: "bethany@gmail.com", password: "puck", awards_name: "Nerdies")
award1 = Award.create(year: "1992", user_id: 1,
    best_film: "Unforgiven",
    best_director: "Spike Lee - Malcolm X",
    best_actor: "Denzel Washington - Malcolm X",
    best_actress: "Whoopi Goldberg - Sister Act",
    best_supporting_actor: "Gene Hackman - Unforgiven",
    best_supporting_actress: "Judy Davis - Husbands and Wives",
    best_screenplay: "The Player",
    best_cinematography: "Baraka",
    best_film_editing: "A Few Good Men",
    best_score: "Last of the Mohicans")
movie1 = Movie.create(title: "Unforgiven", release_year: 1992)