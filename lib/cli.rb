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
  
  