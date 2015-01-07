class UnarySolver
  
  attr_reader :vars, :unary_constraints
  
  def initialize(vars, unary_constraints)
    @vars, @unary_constraints = vars, unary_constraints
  end
  
  def call
    unary_constraints.each { |cons| vars.each { |var| var.constrain(cons) } }
  end
  
end