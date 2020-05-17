class Owner
  
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each do |dogs|
      dogs.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cats|
      cats.mood = "happy"
    end
  end

  def sell_dogs
    dogs.each do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
  end

  def sell_cats
    cats.each do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
  end
  
  def sell_pets
    sell_cats
    sell_dogs
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end