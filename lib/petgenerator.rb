class PetGenerator

  def initialize(species, object)
    if species == "Dog"
      @species = "Dog"
    else
      @species = species.downcase
    end
    @animal_object = object

    scrape_and_generate_pets
  end

  def scrape_and_generate_pets 
    hash_of_pets = Scraper.scrape_adoptable_pets(@species)
    @animal_object.create_new(hash_of_pets)
  end

  def self.add_attributes_to_animals(number, animal_object)
    pet = animal_object.all[number]
    attributes = Scraper.scrape_pet_profile(pet.url)
    pet.add_attributes(attributes)
  end

end