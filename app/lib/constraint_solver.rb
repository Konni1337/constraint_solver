Dir[File.dirname(__FILE__) + '/**/*.rb'].each { |file| require file }

class ConstraintSolver

  attr_reader :vars, :binary_cons, :unary_cons

  def initialize
    @binary_cons, @unary_cons = Constraints.binary_constraints, Constraints.unary_constraints
    @vars  = BinarySolver.new(UnarySolver.new(Variables.new, unary_cons).call, binary_cons).call
  end

  def call
    @vars = solve(vars)
    raise 'No solution!' unless vars.done?
    vars
  end

  private

  def solve(variables)
    return variables if variables.inconsistent? || variables.done?
    new_vars = variables.build_copy
    to_try = new_vars.first_unfinished
    until to_try.nil? || to_try.domain.empty? || new_vars.done?
      new_vars = variables.build_copy
      new_vars[to_try.name]= to_try.domain.shift
      new_vars = solve(BinarySolver.new(new_vars, binary_cons).call)
    end
    new_vars
  end

end

p ConstraintSolver.new.call