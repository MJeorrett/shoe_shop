require_relative('../db/sql_runner')

require('pry-byebug')

class Order

  attr_reader :id, :address, :quantity, :size

  def initialize( options )

    set_id( options['id'] )

    @address = options['address']
    @quantity = options['quantity'].to_i
    @size = options['size'].to_i
  end

  def save
    sql = "INSERT INTO orders (address, quantity, size) VALUES ('#{@address}', #{@quantity}, #{@size}) RETURNING id"
    order_data = SqlRunner.run(sql)
    set_id( order_data.first['id'] )
  end

  def self.all()
    sql = "SELECT * FROM orders"
    data = SqlRunner.run( sql )
    return self.data_to_objects( data )
  end

  def self.total_quantity
    sql = "SELECT SUM(quantity) FROM orders"
    result = SqlRunner.run(sql)
    return result.first["sum"].to_i
  end

  private

  def set_id( id_str )
    @id = id_str.to_i if id_str != nil
  end

  def self.data_to_objects(objects_data)
    return objects_data.map{|object_data| Order.new(object_data)}
  end

  def self.data_to_object(object_data)
    return self.data_to_objects(object_data).first
  end
end
