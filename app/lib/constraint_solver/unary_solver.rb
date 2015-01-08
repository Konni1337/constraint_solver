class UnarySolver
  
  attr_reader :vars, :unary_constraints
  
  def initialize(vars, unary_constraints)
    @vars, @unary_constraints = vars, unary_constraints
  end
  
  def call
    unary_constraints.each { |cons| vars.each { |var| constrain(var, cons) } }
    vars
  end

  private

  def constrain(var, cons)
    var.domain.delete_if {|val| cons.inconsistent?(val) } if cons.right_variable?(var.name)
  end
  
end