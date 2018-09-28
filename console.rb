require_relative('./models/actor.rb')
require_relative('./models/movie.rb')
require_relative('./models/role.rb')

require('pry')

Role.delete_all()
Movie.delete_all()
Actor.delete_all()

actor1 = Actor.new({
'first_name' => 'Elijah',
'last_name' => 'Wood'

  })
actor2 = Actor.new({
  'first_name' => 'Bradley',
  'last_name' => 'Whitford'

  })
actor3 = Actor.new({
  'first_name' => 'Nathan',
  'last_name' => 'Fillion'
  })
actor4 = Actor.new({
  'first_name' => 'Eddie',
  'last_name' => 'Redmayne'
  })

  actor1.save
  actor2.save
  actor3.save
  actor4.save

movie1 = Movie.new({
  'title' => 'Pirates of the Carribbean',
  'genre' => 'comedy'
  'bodget' => 8000000
  })

movie2 = Movie.new({
  'title' => 'Team America',
  'genre' => 'horror'
  'bodget' => 1000000
  })

movie1.save
movie2.save

role1 = Role.new({
  'actor_id' => actor1.id,
  'movie_id' => movie1.id,
  'fee' => 9000
  })
role2 = Role.new({
  'actor_id' => actor2.id,
  'movie_id' => movie1.id,
  'fee' => 80000
  })
role3 = Role.new({
  'actor_id' => actor3.id,
  'movie_id' => movie1.id,
  'fee' => 700000
  })
role4 = Role.new({
  'actor_id' => actor4.id,
  'movie_id' => movie1.id,
  'fee' => 6000000
  })
role5 = Role.new({
  'actor_id' => actor1.id,
  'movie_id' => movie2.id,
  'fee' => 9000
  })


role1.save
role2.save
role3.save
role4.save
role5.save

movie1.actors
actor1.movies

binding.pry
nil
