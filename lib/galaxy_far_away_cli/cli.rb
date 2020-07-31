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
    puts "2. See All Characters"
    puts "3. exit"

    @user_input = gets.chomp

    if @user_input == "1"
      # see all Films
      film_list
    elsif @user_input == "2"
      # see all Characters
      film_opening_crawl
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
    puts "What movie would you like to know more about?"
    @user_input = gets.strip.downcase

    film_selection(@user_input)
  end

  def film_selection(film)
    f = Film.find_by_name(film)
    binding.pry
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
