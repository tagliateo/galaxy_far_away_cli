class GalaxyFarAwayCli::CLI

  def call
    system ("clear")
    @user_input = nil
    APIService.fetch_data
    APIService.fetch_species_data
    # binding.pry
    welcome
    until @user_input == "3"
      main_menu
    end
  end

  def welcome
    puts "---------------------------------".colorize(:light_black)
    puts "/////////////////////////////////".colorize(:light_black)
    puts "--Welcome to a CLI far far away--".colorize(:green)
    puts "/////////////////////////////////".colorize(:light_black)
    puts "---------------------------------".colorize(:light_black)
  end

  def main_menu
    puts ''
    puts "What would you like to do?"
    puts ''
    puts "1. See a specific list of all Star Wars films"
    puts "2. See a list of all Species in Star Wars"
    puts "3. Exit"
    puts ''

    @user_input = gets.chomp

    if @user_input == "1"
      # see all Films
      film_list
    elsif @user_input == "2"
      # returns all a list of species
      species_list
    elsif @user_input == "3"
      # exit
      goodbye
    else
      invalid_entry
    end
  end

  def film_list
    Film.all.each_with_index do |film, index|
      puts "#{index + 1}. #{film.title}"
    end
    puts""
    puts ""
    print "Please type out the name of the movie you would like to know more about? "

    @user_input = gets.strip.downcase

    film_selection(@user_input)
    # binding.pry
  end

  def film_selection(name)
    film = Film.find_by_name(name)
    if film 
    # binding.pry
      display_film(film)
    else 
      case_error
    end
  end
  # displays film information
  def display_film(film)
    puts ''
    puts "Title: #{film.title}"
    puts "Episode ID: #{film.episode_id}"
    puts "Producer(s): #{film.producer}"
    puts "Director(s): #{film.director}"
    puts ''
    puts "Opening Crawl:"
    puts ''
    puts "#{film.opening_crawl}"
  end
  # creates a list of species
  def species_list
    Species.all.each_with_index do |species, index|
      puts "#{index + 1}. #{species.name}"
    end
    puts ""
    puts ""
    print "What species would you like to know more about? "

    @user_input = gets.strip.downcase

    species_selector(@user_input)
    # binding.pry
  end

# returns designated information
  def species_selector(name)
    puts ''
    fauna = Species.find_by_name(name)
    # binding.pry
    if fauna
        display_species(fauna)
    else
      name_error
    end
  end

  def display_species(species)
    puts "Name: #{species.name}"
    puts "Classification: #{species.classification}"
    puts "Designation: #{species.designation}"
    puts "Average Height: #{species.average_height}"
    puts "Hair Color(s): #{species.hair_colors}"
    puts "Eye Color(s): #{species.eye_colors}"
    puts "Language: #{species.language}"
  end

  def invalid_entry
    puts "Invalid entry! Error! Try Again!".colorize(:red)
    puts ''
    main_menu
  end

  def case_error
    puts "Invalid entry! Try typing out the film name!".colorize(:red)
    puts ''
    film_list
  end

  def name_error
    puts "Invalid entry! Please retype the name!".colorize(:red)
    puts ''
    species_list
  end

  def goodbye
    puts ''
    puts "May the force be with you!".colorize(:green)
    puts ''
  end

end
