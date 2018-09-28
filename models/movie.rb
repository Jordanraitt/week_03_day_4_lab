require_relative('../db/sql_runner.rb')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @genre = options['genre']
      @bodget = options['bodget']
    end

    def save()
      sql = "
      INSERT INTO movies
      (title, genre, bodget)
      VALUES
      ($1, $2, $3)
      RETURNING id;
      "
      values = [@title, @genre, @bodget]
      movie = SqlRunner.run( sql, values ).first
      @id = movie['id'].to_i
    end

    def update()
      sql = "
      UPDATE movies
      SET (title, genre, bodget) = ($1, $2, $3)
      WHERE id = $4;
      "

      values = [@title, @genre, @bodget, @id]

      SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM movies"
        SqlRunner.run(sql)
      end

    def actors()
      sql = "
        SELECT actors.*
        FROM actors
        INNER JOIN roles
        ON actors.id = roles.actor_id
        WHERE roles.movie_id = $1
        "
        actor = SqlRunner.run(sql, [@id])
        result = actor.map do |fellows| Actor.new(fellows)
        end
        return result
    end

end
