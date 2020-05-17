class Owner

  attr_reader :name, :species
  attr_accessor :mood

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def say_species
    "I am a #{species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |all_cats|
      all_cats.owner == self
    end
  end

  def dogs
    Dog.all.select do |all_dogs|
      all_dogs.owner == self
    end
  end

  def walk_dogs
    dogs.each do |mood_inst|
      mood_inst.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |mood_inst|
      mood_inst.mood = "happy"
    end
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end