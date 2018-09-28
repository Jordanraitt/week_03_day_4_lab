require_relative('../db/sql_runner.rb')

class Role

  attr_reader :id
  attr_accessor :actor_id, :movie_id, :fee

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @actor_id = options['actor_id'].to_i
      @movie_id = options['movie_id'].to_i
      @fee = options['fee']

    end

    def save()
      sql = "
      INSERT INTO roles
      (actor_id, movie_id, fee)
      VALUES
      ($1, $2, $3)
      RETURNING id;
      "
      values = [@actor_id, @movie_id, @fee]
      role = SqlRunner.run( sql, values ).first
      @id = role['id'].to_i
    end

    def update()
      sql = "
      UPDATE roles
      SET (fee) = ($1)
      WHERE id = $2;
      "

      values = [@fee, @id]

      SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "
        DELETE FROM roles;
        "
        SqlRunner.run(sql)
      end

end
