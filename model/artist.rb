require('pg')
require_relative('./album')
require_relative('../db/sql_runner')

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    list_of_artists = SqlRunner.run(sql)
    return list_of_artists.map { |artist| Artist.new(artist) }
  end

  def list_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{ |album| Album.new(album) }
  end

end
