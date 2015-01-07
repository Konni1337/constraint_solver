class UnaryConstraint

  attr_reader :var_name, :constraint
  
  def initialize(var_name, constraint)
    @var_name, @constraint = var_name, constraint
  end

  def consistent?(var)
    eval(constraint).call(var)
  end

  def inconsistent?(var)
    !consistent?(var)
  end

  def right_variable?(var_name_other)
    var_name_other == var_name
  end

  def to_s
    "<BinaryConstraint: var_name = #{var_name}, constraint = #{constraint}>"
  end

end