require 'pry'
class Owner
  attr_reader :species, :name

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def self.all
    @@all
  end

  def save
    Owner.all << self
  end

  def self.count 
    @@all.count
  end


  def buy_cat(cat_name)
    new_pet = Cat.new(cat_name, self)
    #Owner.all << new_pet
  end 

  def buy_dog(dog_name)
    new_pet = Dog.new(dog_name, self)
    #Owner.all << new_pet
  end

  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end

  def cats 
    Cat.all.select do |cats|
      cats.owner == self
    end
  end

  def walk_dogs
    self.dogs.map do |dogs|
      dogs.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cats|
      cats.mood = "happy"
    end
  end

  def say_species
    "I am a human."
  end

  def self.reset_all
    @@all.clear
  end


  def list_pets
    
      "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
 
  def sell_pets
    self.cats.map do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
    self.dogs.map do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil
    end
  end

end

  # def list_pets
  #   #   if self.dogs.length <= 1 && self.cats.length <= 1
  #   #     "I have #{self.dogs.length} dog and #{self.cats.length} cat."
  #   #   elsif self.dogs.length <= 1 && self.cats.length > 1
  #   #     "I have #{self.dogs.length} dog and #{self.cats.length} cats"
  #   #   elsif self.dogs.length > 1 && self.cats.length <= 1
  #   #     "I have #{self.dogs.length} dogs and #{self.cats.length} cat"
  #   #   else
  #   #     "I have #{self.dogs.length} dogs and #{self.cats.length} cat"
  #   #   end
  #   # end

  #should make a dogs_length/number and cats_length/total function