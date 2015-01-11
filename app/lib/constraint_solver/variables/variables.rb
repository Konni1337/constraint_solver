class Variables

  class << self

    def variables
      [
          # pets
          Variable.new(:fish, default_domain),
          Variable.new(:dog, default_domain),
          Variable.new(:cat, default_domain),
          Variable.new(:bird, default_domain),
          Variable.new(:horse, default_domain),
          # poeple
          Variable.new(:briton, default_domain),
          Variable.new(:swede, default_domain),
          Variable.new(:dane, default_domain),
          Variable.new(:norwegian, default_domain),
          Variable.new(:german, default_domain),
          # color of house
          Variable.new(:red, default_domain),
          Variable.new(:green, default_domain),
          Variable.new(:white, default_domain),
          Variable.new(:blue, default_domain),
          Variable.new(:yellow, default_domain),
          # drinks
          Variable.new(:water, default_domain),
          Variable.new(:milk, default_domain),
          Variable.new(:tea, default_domain),
          Variable.new(:coffee, default_domain),
          Variable.new(:beer, default_domain),
          # cigarettes
          Variable.new(:malboro, default_domain),
          Variable.new(:winfield, default_domain),
          Variable.new(:pall_mall, default_domain),
          Variable.new(:dunhill, default_domain),
          Variable.new(:rothmanns, default_domain)
      ]
    end

    private

    # house position
    def default_domain
      [0, 1, 2, 3, 4]
    end

=begin
    def variables
      [
          Variable.new(:a, default_domain),
          Variable.new(:b, default_domain),
          Variable.new(:c, default_domain),
          Variable.new(:d, default_domain)
      ]
    end

    private

    def default_domain
      [1, 2, 3, 4]
    end
=end

  end

  attr_reader :vars

  def initialize(vars = Variables.variables)
    @vars = vars
  end

  def each(&block)
    vars.each(&block)
  end

  def select(&block)
    vars.select(&block)
  end

  def [](name)
    vars.select {|var| var.name == name}.first.domain
  end

  def []=(name, value)
    vars.select {|var| var.name == name}.first.domain = value.is_a?(Array) ? value : [value]
  end

  def done?
    return false if vars.any? { |var| var.domain.length != 1}
    true
    #vars.map(&:domain).uniq.length == vars.length
  end

  def not_done?
    !done?
  end

  def consistent?
    return false if vars.any? { |var| var.domain.length == 0}
    true
  end

  def inconsistent?
    !consistent?
  end

  def first_unfinished
    unfinished_vars = vars.select {|var| var.domain.length > 1}
    return unless unfinished_vars
    unfinished_vars.first
  end

  def build_copy
    Marshal.load( Marshal.dump(self.dup) )
  end

  def to_s
    vars.join(', ')
  end

  def not_all_different?
    return true unless
    # pets different
    self[:fish] != self[:dog] && self[:fish] != self[:cat] && self[:fish] != self[:bird] && self[:fish] != self[:horse] &&
    self[:dog] != self[:cat] && self[:dog] != self[:bird] && self[:dog] != self[:horse] &&
    self[:cat] != self[:bird] && self[:cat] != self[:horse] &&
    self[:bird] != self[:horse] &&
    # poeple different
    self[:briton] != self[:swede] && self[:briton] != self[:dane] && self[:briton] != self[:norwegian] && self[:briton] != self[:german] &&
    self[:swede] != self[:dane] && self[:swede] != self[:norwegian] && self[:swede] != self[:german] &&
    self[:dane] != self[:norwegian] && self[:dane] != self[:german] &&
    self[:norwegian] != self[:german] &&
    # color of houses different
    self[:red] != self[:green] && self[:red] != self[:white] && self[:red] != self[:blue] && self[:red] != self[:yellow] &&
    self[:green] != self[:white] && self[:green] != self[:blue] && self[:green] != self[:yellow] &&
    self[:white] != self[:blue] && self[:white] != self[:yellow] &&
    self[:blue] != self[:yellow] &&
    # drinks different
    self[:water] != self[:milk] && self[:water] != self[:tea] && self[:water] != self[:coffee] && self[:water] != self[:beer] &&
    self[:milk] != self[:tea] && self[:milk] != self[:coffee] && self[:milk] != self[:beer] &&
    self[:tea] != self[:coffee] && self[:tea] != self[:beer] &&
    self[:coffee] != self[:beer] &&
    # drinks different
    self[:malboro] != self[:winfield] && self[:malboro] != self[:pall_mall] && self[:malboro] != self[:dunhill] && self[:malboro] != self[:rothmanns] &&
    self[:winfield] != self[:pall_mall] && self[:winfield] != self[:dunhill] && self[:winfield] != self[:rothmanns] &&
    self[:pall_mall] != self[:dunhill] && self[:pall_mall] != self[:rothmanns] &&
    self[:dunhill] != self[:rothmanns]
    false
  end

end