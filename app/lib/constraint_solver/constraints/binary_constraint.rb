class BinaryConstraint
  
  attr_reader :var_name1, :var_name2, :constraint
  
  def initialize(var_name1, var_name2, constraint)
    @var_name1, @var_name2, @constraint = var_name1, var_name2, constraint
  end
  
  def consistent?(var1, var2)
     eval(constraint).call(var1, var2)
  end
  
  def inconsistent?(var1, var2)
    !consistent?(var1, var2)
  end
  
  def right_variables?(var_name_other1, var_name_other2)
    var_name_other1 == var_name1 && var_name_other2 == var_name2
  end

  def to_s
    "<BinaryConstraint: var_name1 = #{var_name1}, var_name2 = #{var_name2}, constraint = #{constraint}>"
  end
    
end