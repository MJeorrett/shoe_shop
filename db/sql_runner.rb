require('pg')

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect( { dbname: 'shoe_shop', host: 'localhost'})
      results = db.exec(sql)
    ensure
      db.close
    end
    return results
  end

end
