# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

# Validation rules:
# * Any of the sides must be under 1 (0 or negative)
# * The sum of two side must be highter than the third side
def validate_triangle_sides!(a, b, c)

  # Any of the sides must be under 1 (0 or negative)
  if [a, b, c].min < 1
    raise TriangleError, "At least one of the side is bellow 1"
  end

  # The sum of two side must be highter than the third side
  # == The sum of the two lower sides must always be bigger than the third
  x, y, z = [a, b, c].sort
  if (x + y) <= z
    raise TriangleError, "The sum of two side must be highter than the third side"
  end
end

def triangle(a, b, c)
  # if a == b && a == c
  #   return :equilateral
  # elsif (a == b && a != c) || (a == c && a != b) || (b == c && b != a)
  #   return :isosceles
  # else
  #   return :scalene
  # end
  #

  validate_triangle_sides!(a, b, c)

  # More elegant solution
  # => See http://stackoverflow.com/questions/4742692/a-more-elegant-solution-to-ruby-koans-triangle-rb
  case [a, b, c].uniq.size
  when 1
    return :equilateral
  when 2
    return :isosceles
  else
    return :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
