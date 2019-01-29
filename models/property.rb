require('pg')

class Property

  attr_accessor :address, :value, :year_built, :buy_let_status

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @year_built = options['year_built'].to_i
    @buy_let_status = options['buy_let_status']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO property (
    address,
    value,
    year_built,
    buy_let_status
    )
    VALUES ( $1, $2, $3, $4 ) RETURNING id"
    values = [@address, @value, @year_built, @buy_let_status]
    db.prepare("save", sql)
    @id = db.exec_prepared("save",values)[0]['id'].to_i
    db.close()
  end


  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE property SET(
    address,
    value,
    year_built,
    buy_let_status
    ) = (
      $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@address, @value, @year_built, @buy_let_status,@id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

   def delete()
     db = PG.connect({dbname: 'properties', host: 'localhost'})
     sql = "DELETE FROM property WHERE id = $1"
     values = [@id]
     db.prepare("delete_one", sql)
     orders = db.exec_prepared("delete_one", values)
     db.close()
   end

   def delete_all()
     db = PG.connect({dbname: 'properties', host: 'localhost'})
     sql = "DELETE FROM property"
     db.prepare("delete_all",sql)
     db.exec_prepared("delete_all")
     db.close()
   end

   def find()
     db = PG.connect({dbname: 'properties', host: 'localhost'})
     sql = "SELECT * FROM property WHERE address = $1"
     values = [@address]
     db.prepare("find_by_address", sql)
     addresses = db.exec_prepared("find_by_address", values)
     db.close()
     return addresses.map { |address| Property.new(address) }
   end



# Full CRUD functionality
# The ability to find properties by id
# The ability to find properties by address


end
