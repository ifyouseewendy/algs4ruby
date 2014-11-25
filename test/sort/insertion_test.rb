require 'test_helper'

class TestDemo < MiniTest::Unit::TestCase
  def setup
    @msg = 'hello world'
  end
  def test_hello_world
    assert_equal 'hello world', @msg
  end
end
