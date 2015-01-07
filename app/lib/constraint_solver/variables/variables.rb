class Variables

  class << self

    def variables
      [
          Variable.new(:a, default_domain),
          Variable.new(:b, default_domain),
          Variable.new(:c, default_domain),
          Variable.new(:d, default_domain)
      ].to_a
    end

    private

    def default_domain
      [1, 2, 3, 4]
    end

  end

  attr_reader :vars

  def initialize(vars = Variables.variables)
    @vars = vars
  end

  def each(&block)
    vars.each(&block)
  end

  def [](name)
    vars.select {|var| var.name == name}.first.domain
  end

end