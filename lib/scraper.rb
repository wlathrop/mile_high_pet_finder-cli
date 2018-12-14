class Scraper

  def self.scrape_adoptable_pets(animal)
    pets = []
    doc = Nokogiri::HTML(open("https://www.hsppr.org/adopt/#{animal}"))
    doc.css("node node--teaser petharbor-pet pet-card springs").each do |pet|
      pet_details = {}
      pet_details[:species] = animal
      pet_details[:name] = pet.css("field field--field-petharbor-name").text
      pet_details[:breed] = pet.css("field field--field-petharbor-breed").text
      pet_details[:age] = pet.css("field field--field-petharbor-age").text
      pet_details[:url] = pet.css("a").attribute("href").value
      pets << pet_details
    end
    pets
  end

  def self.scrape_pet_profile(url)
    pet_profile_details = {}

    pet_profile = "https://www.hsppr.org" + url
    doc = Nokogiri::HTML(open(pet_profile))

    pet_items = doc.css("field-group-div")

   