class Owner
  attr_reader :name, :species

  def initialize
    @species = human
  end

  def say_species
    @species
  end
  
end