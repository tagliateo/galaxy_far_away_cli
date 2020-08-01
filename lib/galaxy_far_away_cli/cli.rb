class GalaxyFarAwayCli::CLI

  def call
    # system (clear)
    @user_input = nil
    welcome
    APIService.fetch_data
    main_menu
  end

  def welcome
    puts "--Welcome to a CLI far far away--".colorize(:green)
  end

  def main_menu
    puts "What would you like to do?"
    puts "1. See a list of all Star Wars films"
    puts "2. See All Film Opening Crawls"
    puts "3. See All Species"
    puts "4. exit"

    @user_input = gets.chomp

    if @user_input == "1"
      # see all Films
      film_list
    elsif @user_input == "2"
      # see all Characters
      film_opening_crawl
    elsif @user_input == "3"
      # specie
      # specie_list
      display_film_information
    elsif @user_input == "4"
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
    puts "What movie would you like to know more about?"
    input = gets.strip.downcase

    # if @user_input == "1"
    film_selection(input)
  end

  # def specie_list
  #   Film.all.each_with_index do |specie, index|
  #     puts "#{index + 1}. #{film.specie}"
  # end

  # end
# gives a list of the films
  def film_selection(film)
    Film.find_by_name(film)
    # binding.pry
  end

  # def specie_selector(species)
  #   Film.find_by_name(species)
  # end
# displays the film crawl for each film

  def display_film_information
      puts ''
      film = Film.all.each { |film| puts "#{film.title}: #{film.opening_crawl} Director/s: #{film.director} Producer/s: #{film.producer}"}
      puts ''
      # film.select.with_index {|film, index| puts "#{index}. film" }
  end

  def film_opening_crawl
    Film.all.each_with_index do |film, index|
      puts "#{index + 1}. #{film.opening_crawl}"
    end
  end

  def invalid_entry
    puts "Invalid entry! Error! Try Again!".colorize(:red)
    main_menu
  end

  def goodbye
    puts "May the force be with you!"
  end

end
