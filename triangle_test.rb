# 1. Copy this file from the course notes repo into a new repository
# 2. Run `ruby triangle_test.rb`. You should see 6 error messages.
# 3. Implement the Triangle class until all 6 tests are passing.
require "minitest/autorun"
#require 'pry'

class Triangle
  def initialize(side1, side2, side3)
      @side1 = side1
      @side2 = side2
      @side3 = side3
  end

  def validate (side1, side2, side3)
    if side1.class == Fixnum && side2.class == Fixnum && side3.class == Fixnum
      return true
    else
      raise 'You need to enter a number that is > 0'
    end
  end

  def kind 
    if validate @side1,@side2,@side3
      if @side1 == @side2 && @side2 == @side3
        return :equilateral
      elsif (@side1 == @side2 || @side1 == @side3 || @side2 == @side3)
        return :isosceles
      else 
        return :scalene
      end
    end
  end

  def perimeter
    return @side1 + @side2 + @side3
  end
end

class TestMeme < Minitest::Test
  def test_equilateral
    t = Triangle.new(5,5,5)
    assert_equal :equilateral, t.kind
  end

  def test_isosceles
    s = Triangle.new(2,2,3)
    assert_equal :isosceles, s.kind
  end

  def test_other_isosceles
    t = Triangle.new 3,4,3
    assert_equal :isosceles, t.kind
  end

  def test_scalene
    t = Triangle.new 6,7,8
    assert_equal :scalene, t.kind
  end

  def test_perimeter_right
    t = Triangle.new 3,4,5
    assert_equal 12, t.perimeter
  end

  def test_perimeter_eq
    t = Triangle.new 10,20,30
    assert_equal 60, t.perimeter
  end

  def test_triangle_side_0
    t = Triangle.new 0,1,2
    assert_equal nil, t
  end 
end


