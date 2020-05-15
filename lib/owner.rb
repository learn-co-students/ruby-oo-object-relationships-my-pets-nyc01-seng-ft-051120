class Owner
  # code goes here
  @@all = []
  attr_reader :name,:species

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
    Owner.all.length
  end

  def self.reset_all
    Owner.all.clear 
  end

  def cats 
    Cat.all.select{|x| x.owner == self}
  end

  def dogs
    Dog.all.select{|x| x.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    self.dogs.each{|x| x.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|x| x.mood = "happy" }
  end

  def sell_pets
      pets = self.cats + self.dogs
      pets.each do |x| 
        x.owner = nil
        x.mood = "nervous"
      end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end