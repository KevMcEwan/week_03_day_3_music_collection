require('pry')
require_relative('../model/album')
require_relative('../model/artist')
require_relative('../db/sql_runner')

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'Guns N Roses'})
artist2 = Artist.new({'name' => 'The Beatles'})
artist3 = Artist.new({'name' => 'Kate Bush'})
artist1.save()
artist2.save()
artist3.save()


album1 = Album.new({'title' => 'Appetite for Destruction', 'genre' => 'rock', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Revolver', 'genre' => 'pop', 'artist_id' => artist2.id})
album3 = Album.new({'title' => 'Lionheart', 'genre' => 'eccentric', 'artist_id' => artist3.id})
album4 = Album.new({'title' => 'Use your Illusion', 'genre' => 'rock', 'artist_id' => artist1.id})
album5 = Album.new({'title' => 'Rubber Soul', 'genre' => 'pop', 'artist_id' => artist2.id})
album6 = Album.new({'title' => 'The Kick Inside', 'genre' => 'eccentric', 'artist_id' => artist3.id})
album1.save
album2.save
album3.save
album4.save
album5.save
album6.save

artist1.name = "GNR"

artist1.update

album1.title = "The Spaghetti Incident"

album1.update

# p album1.find_artist
# p artist1.list_albums()
# p Artist.all()
# p Album.all()
