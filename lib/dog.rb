require 'pry'

class Dog
  attr_accessor :mood,:owner
  attr_reader :name
  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end

  def self.all
    @@all
  end

  def save
    Dog.all << self
  end
  
  
end