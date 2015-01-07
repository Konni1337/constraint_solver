class BinarySolver

  attr_reader :vars, :constraints, :queue

  def initialize(vars, constraints)
    @vars, @constraints = vars, constraints
  end

  def call
    @queue = constraints.clone
    while queue.any?
      constraint = queue.shift
      revise_and_add(vars[constraint.var_name1], vars[constraint.var_name2], constraint)
    end
    vars
  end

  private

  def revise_and_add(domain1, domain2, constraint)
    domain1_before, domain2_before = domain1.length, domain2.length
    revise(domain1, domain2, constraint)
    add_involving_constraints(constraint, constraint.var_name1) if domain1_before != domain1.length
    add_involving_constraints(constraint, constraint.var_name2) if domain2_before != domain2.length
  end

  def revise(domain1, domain2, constraint)
    domain1.delete_if { |val1| domain2.none? { |val2| constraint.consistent?(val1, val2) } }
    domain2.delete_if { |val1| domain1.none? { |val2| constraint.consistent?(val2, val1) } }
  end

  def add_involving_constraints(constraint, var_name)
    constraints
        .select { |con| add?(con, constraint, var_name) }
        .each { |con| queue.push(con) }
  end

  def add?(new_con, con, name)
    !queue.include?(new_con) && con != new_con && new_con.var_name1 == name || new_con.var_name2 == name
  end

end