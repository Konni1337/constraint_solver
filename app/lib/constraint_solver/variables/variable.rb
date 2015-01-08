class Variable

  attr_reader :name, :domain

  def initialize(name, domain)
    @name, @domain = name, domain
  end

  def domain=(value)
    raise "Domain has to be an Array!" unless value.is_a?(Array)
    @domain = value
  end

  def to_s
   "<Variable: name = #{name}, domain = #{domain}>"
  end

end