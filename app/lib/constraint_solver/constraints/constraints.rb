class Constraints

  class << self

    def binary_constraints
      [ab, ac, ad, bc, bd, cd]
    end

    def unary_constraints
      [c, d]
    end

    private

    def ab
      BinaryConstraint.new(:a, :b, 'Proc.new { |var1, var2| var2 == var1 + 1 }')
    end

    def bd
      BinaryConstraint.new(:b, :d, 'Proc.new { |var1, var2| var2 < var1 }')
    end

    def bc
      BinaryConstraint.new(:b, :c, 'Proc.new { |var1, var2| (var1 - var2).abs > 1 }')
    end

    def ac
      BinaryConstraint.new(:a, :c, 'Proc.new { |var1, var2| var1 != var2 }')
    end

    def ad
      BinaryConstraint.new(:a, :d, 'Proc.new { |var1, var2| var1 != var2 }')
    end

    def cd
      BinaryConstraint.new(:c, :d, 'Proc.new { |var1, var2| var1 != var2 }')
    end

    def c
      UnaryConstraint.new(:c, 'Proc.new { |var| var != 4 }')
    end

    def d
      UnaryConstraint.new(:d, 'Proc.new { |var| var != 2 }')
    end

  end

end