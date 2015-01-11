class Constraints

  class << self

    def binary_constraints
      [
          briton_in_red_house,
          swede_has_dog,
          dane_drinks_tea,
          green_left_to_white,
          green_drinks_coffee,
          pall_mall_has_bird,
          yellow_smokes_dunhill,
          malboro_next_to_cat,
          horse_next_to_dunhill,
          winfield_drinks_beer,
          norwegian_next_to_blue,
          german_smokes_rothmanns,
          malboro_next_to_water,
          all_different
      ].flatten
    end

    def unary_constraints
      [norwegian_first_house, milk_middle_house]
    end

    private

    ##### Binary Constraints #####

    def briton_in_red_house
      BinaryConstraint.new(:briton, :red, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def swede_has_dog
      BinaryConstraint.new(:swede, :dog, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def dane_drinks_tea
      BinaryConstraint.new(:dane, :tea, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def green_left_to_white
      BinaryConstraint.new(:green, :white, 'Proc.new { |val1, val2| (val1 + 1) == val2 }')
    end

    def green_drinks_coffee
      BinaryConstraint.new(:green, :coffee, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def pall_mall_has_bird
      BinaryConstraint.new(:pall_mall, :bird, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def yellow_smokes_dunhill
      BinaryConstraint.new(:yellow, :dunhill, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def malboro_next_to_cat
      BinaryConstraint.new(:malboro, :cat, 'Proc.new { |val1, val2| (val1 + 1) == val2 || (val2 + 1) == val1 }')
    end

    def horse_next_to_dunhill
      BinaryConstraint.new(:horse, :dunhill, 'Proc.new { |val1, val2| (val1 + 1) == val2 || (val2 + 1) == val1 }')
    end

    def winfield_drinks_beer
      BinaryConstraint.new(:winfield, :beer, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def norwegian_next_to_blue
      BinaryConstraint.new(:norwegian, :blue, 'Proc.new { |val1, val2| (val1 + 1) == val2 || (val2 + 1) == val1 }')
    end

    def german_smokes_rothmanns
      BinaryConstraint.new(:german, :rothmanns, 'Proc.new { |val1, val2| val1 == val2 }')
    end

    def malboro_next_to_water
      BinaryConstraint.new(:malboro, :water, 'Proc.new { |val1, val2| (val1 + 1) == val2 || (val2 + 1) == val1 }')
    end

    def all_different
      [
          all_pets_different,
          all_poeple_different,
          all_colors_of_houses_different,
          all_drinks_different,
          all_cigaretts_different
      ].flatten
    end

    def all_pets_different
      [
          BinaryConstraint.new(:fish, :dog, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:fish, :cat, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:fish, :bird, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:fish, :horse, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dog, :cat, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dog, :bird, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dog, :horse, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:cat, :bird, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:cat, :horse, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:bird, :horse, 'Proc.new { |val1, val2| val1 != val2 }')
      ]
    end

    def all_poeple_different
      [
          BinaryConstraint.new(:briton, :swede, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:briton, :dane, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:briton, :norwegian, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:briton, :german, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:swede, :dane, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:swede, :norwegian, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:swede, :german, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dane, :norwegian, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dane, :german, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:norwegian, :german, 'Proc.new { |val1, val2| val1 != val2 }')
      ]
    end

    def all_colors_of_houses_different
      [
          BinaryConstraint.new(:red, :green, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:red, :white, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:red, :blue, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:red, :yellow, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:green, :white, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:green, :blue, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:green, :yellow, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:white, :blue, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:white, :yellow, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:blue, :yellow, 'Proc.new { |val1, val2| val1 != val2 }')
      ]
    end

    def all_drinks_different
      [
          BinaryConstraint.new(:water, :milk, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:water, :tea, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:water, :coffee, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:water, :beer, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:milk, :tea, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:milk, :coffee, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:milk, :beer, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:tea, :coffee, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:tea, :beer, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:coffee, :beer, 'Proc.new { |val1, val2| val1 != val2 }')
      ]
    end

    def all_cigaretts_different
      [
          BinaryConstraint.new(:malboro, :winfield, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:malboro, :pall_mall, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:malboro, :dunhill, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:malboro, :rothmanns, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:winfield, :pall_mall, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:winfield, :dunhill, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:winfield, :rothmanns, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:pall_mall, :dunhill, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:pall_mall, :rothmanns, 'Proc.new { |val1, val2| val1 != val2 }'),
          BinaryConstraint.new(:dunhill, :rothmanns, 'Proc.new { |val1, val2| val1 != val2 }')
      ]
    end

    ##### Unary Constraints #####

    def norwegian_first_house
      UnaryConstraint.new(:norwegian, 'Proc.new { |val| val == 1 }')
    end

    def milk_middle_house
      UnaryConstraint.new(:milk, 'Proc.new { |val| val == 3 }')
    end



=begin
    def binary_constraints
      [ab, ac, ad, bc, bd, cd]
    end

    def unary_constraints
      [c, d]
    end

    private

    def ab
      BinaryConstraint.new(:a, :b, 'Proc.new { |val1, val2| val2 == val1 + 1 }')
    end

    def bd
      BinaryConstraint.new(:b, :d, 'Proc.new { |val1, val2| val2 < val1 }')
    end

    def bc
      BinaryConstraint.new(:b, :c, 'Proc.new { |val1, val2| (val1 - val2).abs > 1 }')
    end

    def ac
      BinaryConstraint.new(:a, :c, 'Proc.new { |val1, val2| val1 != val2 }')
    end

    def ad
      BinaryConstraint.new(:a, :d, 'Proc.new { |val1, val2| val1 != val2 }')
    end

    def cd
      BinaryConstraint.new(:c, :d, 'Proc.new { |val1, val2| val1 != val2 }')
    end

    def c
      UnaryConstraint.new(:c, 'Proc.new { |val| val != 4 }')
    end

    def d
      UnaryConstraint.new(:d, 'Proc.new { |val| val != 2 }')
    end
=end

  end

end