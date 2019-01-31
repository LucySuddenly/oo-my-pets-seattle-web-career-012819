class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {fishes: [], dogs: [], cats: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    pets[:dogs].map! do |dog|
      dog.mood=("happy")
    end
  end

  def play_with_cats
    pets[:cats].map! do |cat|
      cat.mood=("happy")
    end
  end

  def feed_fish
    pets[:fishes].map! do |fish|
      fish.mood=("happy")
    end
  end

  def sell_pets
    pets.map do |pet_type, pets_array|
      pets_array.map! do |pet|
        pet.mood=("nervous")
      end
    end
    @pets.clear
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
