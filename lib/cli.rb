class CLI
  PETS = ["Dogs", "Cats", "Other"]

  def call
    puts "\nWELCOME TO MILE HIGH PET FINDER!".light_blue
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    start
  end

  def start
    puts "What kind of pet can I help you find today? (Please enter a number)\n".cyan

    PETS.each.with_index(1) do |animal, number|
      puts "#{number}. #{animal}"
    end

    user_input = number_to_index(gets.chomp)

    if !user_input.between?(0, PETS.size-1)
      puts "\nI'm sorry, that was an incorrect entry. Please try again.\n".red
      start
    end

    @animal_object = define_animal_object(user_input)
    PetGenerator.new(PETS[user_input], @animal_object)

    display_all_animals
  end
  
   def display_all_animals
    if @animal_object == Dogs
      puts "\n\nAVAILABLE DOGS FOR ADOPTION:".light_blue
    else
      puts "\n\nAVAILABLE #{@animal_object.to_s.upcase} FOR ADOPTION:".light_blue
    end
    puts "Name - Breed - Age".cyan
    puts "-----------------------------"

    all_pets = @animal_object.all
    all_pets.each.with_index(1) {|pet, num| puts "#{num}. #{pet.name} - #{pet.breed} - #{pet.age}"}

    puts "\nWhich pet would you like more information on? (Please enter a number)".cyan

    animal_number = number_to_index(gets.chomp)

    if animal_number < 0 || animal_number >= all_pets.size
      puts "I'm sorry, that was an incorrect entry. Please try again.".red
      display_all_animals
    end

    PetGenerator.add_attributes_to_animals(animal_number, @animal_object)
    display_details(animal_number)
  end