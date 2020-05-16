

class Owner
  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    Owner.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
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
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets

    dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end

    cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end

  end

  def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
  
end