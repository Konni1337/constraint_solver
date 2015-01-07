Dir[File.dirname(__FILE__) + '/**/*.rb'].each { |file| require file }

class ConstraintSolver

  attr_reader :vars

  def initialize
    @vars = Variables.new
  end
  
  def solve
    UnarySolver.new(vars, Constraints.unary_constraints).call
    BinarySolver.new(vars, Constraints.binary_constraints).call
    vars
  end

end

p 'start'
p ConstraintSolver.new.solve
p 'end'