class Owner
  attr_reader :name, :species, :owner 
  @@all = []
  def initialize(name, species="human")
    @name = name 
    @owner = self 
    @species = species
    Owner.all << self 
  end 
  def self.all 
    @@all 
  end 
  def say_species
    "I am a #{self.species}."
  end 
  def self.count 
    @@all.count 
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
  Dog.all.each do |dog|
    dog.mood = "happy"
  end 
end 

def feed_cats
  Cat.all.each do |cat|
    cat.mood = "happy"
  end 
end 

def sell_pets
  Dog.all.each do |dog|
    if dog.owner == self 
      dog.owner = nil
      dog.mood = "nervous"
    end
  end 
  Cat.all.each do |cat| 
    if cat.owner == self 
      cat.owner = nil 
      cat.mood = "nervous"
    end 
  end 
end 

def list_pets 
  "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."
end 


end