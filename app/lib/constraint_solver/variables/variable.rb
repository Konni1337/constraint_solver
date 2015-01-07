class Variable

  attr_reader :name, :domain

  def initialize(name, domain)
    @name, @domain = name, domain
  end

  def constrain(constraint)
    raise "Input has to be a UnaryConstraint" unless constraint.is_a?(UnaryConstraint)
    domain.delete_if {|val| constraint.inconsistent?(val) } if constraint.right_variable?(name)
  end

  def to_s
   "<Variable: name = #{name}, domain = #{domain}>"
  end

end