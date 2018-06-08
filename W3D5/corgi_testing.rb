class Corgi
  attr_reader :name

  def self.name
    "Corgi"
  end

  def initialize(name)
    @name = name
  end

  define_method(:output_name) do
    puts name
  end
end

class Dog
  def self.all
    @dogs ||= []
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end

end

class Husky < Dog
  def self.all_huskies
    @@huskies ||= []
  end

  def initialize(name)
    @name = name
    self.class.all << self
  end
end

class HuskyPups < Husky
  Huskym
end
