require('minitest/autorun')
require('minitest/rg')

require_relative('../models/order')

class OrderTest < MiniTest::Test

  def setup

    options = {
      "id" => "13",
      "address"  => '15 Code Base',
      "quantity" => "3",
      "size"     => "8"
    }

    @shoe_order = Order.new( options )

  end

  def test_id()
    id = @shoe_order.id
    assert_equal( Fixnum, id.class() )
    assert_equal( 13, id )
  end

  def test_address
    address = @shoe_order.address
    assert_equal('15 Code Base', address)
    assert_equal(String, address.class)
  end

  def test_quantity
    quantity = @shoe_order.quantity
    assert_equal(3, quantity)
    assert_equal(Fixnum, quantity.class)
  end

  def test_size
    size = @shoe_order.size
    assert_equal(8, size)
    assert_equal(Fixnum, size.class)
  end
  
end
