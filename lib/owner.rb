class Owner
  # code goes here
  @@all=[]
  attr_reader :name, :species
  def initialize(name)
    @name=name
    @species="human"
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
    @@all=[]
  end

  def cats
    Cat.all.select do |cats|
      cats.owner==self
    end
  end

  def dogs
    Dog.all.select do |dogs|
      dogs.owner==self
    end
  end

  def buy_cat(cat)
    Cat.new(cat,self)
  end


  def buy_dog(dog)
    Dog.new(dog,self)
  end

  def walk_dogs
    Dog.all.each do |dogs|
      if dogs.owner==self
        dogs.mood="happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |cats|
      if cats.owner==self
        cats.mood="happy"
      end
    end
  end


  def sell_pets
    sell_cats
    sell_dogs
  end
    

    


    def sell_cats
      Cat.all.each do |cats|
        if cats.owner==self
          cats.mood="nervous"
          cats.owner=nil
        end
      end
    end

    def sell_dogs
      Dog.all.each do |dogs|
        if dogs.owner==self
          dogs.mood="nervous"
          dogs.owner=nil
        end
      end
    end

    def dog_count
      count=0
      Dog.all.each do |dogs|
        if dogs.owner==self
          count +=1
        end
      end
      count
    end

    def cat_count
      count=0
     Cat.all.each do |cats|
        if cats.owner==self
          count +=1
        end
      end
      count
    end

    def list_pets
      "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
    end

end
