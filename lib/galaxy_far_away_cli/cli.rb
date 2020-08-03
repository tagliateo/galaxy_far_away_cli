class GalaxyFarAwayCli::CLI

  def call
    system ("clear")
    @user_input = nil
    APIService.fetch_data
    welcome
    until @user_input == "5"
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
    puts "1. See a list of all Star Wars films"
    puts "2. See All Film Opening Crawls"
    puts "3. See All Film Information"
    puts "4. See a list of all Species in Star Wars"
    puts "5. Exit"
    puts ''

    @user_input = gets.chomp

    if @user_input == "1"
      # see all Films
      film_list
    elsif @user_input == "2"
      # see all Characters
      film_opening_crawl
    elsif @user_input == "3"
      # returns all film information
      display_film_information
    elsif @user_input == "4"
      # returns all a list of species
      species_list
    elsif @user_input == "5"
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
    print "Please type out the name of the movie you would like to know more about?"
    
    @user_input = gets.strip.downcase
    
    film_selection(@user_input)
    # binding.pry
  end

  def film_selection(film)
    films = Film.find_by_name(film)
    # binding.pry
    films.each do |f|
      puts ''
      puts "Title: #{f.title}"
      puts "Episode ID: #{f.episode_id}"
      puts "Producer(s): #{f.producer}"
      puts "Director(s): #{f.director}"
      puts ''
      puts "Opening Crawl:"
      puts ''
      puts "#{f.opening_crawl}"

    end
  end

  def display_film_information
      puts ''
      Film.all.each do |film|
        puts "#{film.episode_id}. #{film.title}:".colorize(:red)
        puts "Director/s: #{film.director}"
        puts "Producer/s: #{film.producer}"
        puts ''
        puts "#{film.opening_crawl}"
        puts ''
      end
  end

  def film_opening_crawl
    puts ''
    Film.all.each_with_index do |film, index|
      puts ''
      puts "#{index + 1}. #{film.title}".colorize(:cyan)
      puts ''
      puts "#{film.opening_crawl}"
    end
    main_menu
  end

  # creates a list of species
  # def species_list
  #   Species.all.each_with_index do |species, index|
  #     puts "#{index + 1}. #{species.title}"
  #   end
  #   puts""
  #   puts ""
  #   print "What species would you like to know more about?"
  #   @user_input = gets.strip.downcase

  #   # film_selection(@user_input)
  #   # binding.pry
  # end

  def invalid_entry
    puts "Invalid entry! Error! Try Again!".colorize(:red)
    main_menu
  end

  def case_error
    puts "Invalid entry! Try typing out the film name!".colorize(:red)
    film_list
  end

  def goodbye
    puts ''
    puts "May the force be with you!".colorize(:cyan)
    puts ''
  end

end
