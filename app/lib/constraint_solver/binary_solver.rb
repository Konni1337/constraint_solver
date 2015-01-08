class BinarySolver

  attr_reader :vars, :constraints, :queue

  def initialize(vars, constraints)
    @vars, @constraints = vars, constraints
  end

  def call
    @queue = constraints.clone
    while queue.any?
      constraint = queue.shift
      domain1, domain2 = vars[constraint.var_name1], vars[constraint.var_name2]
      revise(domain2, domain1) { |val1, val2| constraint.consistent?(val2, val1) }
      break if vars.inconsistent?
      revise(domain1, domain2) { |val1, val2| constraint.consistent?(val1, val2) }
      break if vars.inconsistent?
    end
    vars
  end

  private

  def revise(domain1, domain2)
    domain1.delete_if { |val1| domain2.none? { |val2| yield(val1, val2) } }
  end

end