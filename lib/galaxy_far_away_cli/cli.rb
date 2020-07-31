class GalaxyFarAwayCli::CLI

  def call
    welcome
    main_menu
  end

  def welcome
    puts "--Welcome to a CLI far far away--".colorize(:green)
    APIService.fetch_data
  end

  def main_menu
    puts "What film would you like to see?"
    puts "1. See All Films"
    puts "2. See All Characters"
    puts "3. exit"

    user_input = gets.chomp

    if user_input == "1"
      # see all Films
      film_list
    elsif user_input == "2"
      # see all Characters
    elsif user_input == "3"
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
  end

  def invalid_entry
    puts "Invalid entry! Error! Try Again!".colorize(:red)
    main_menu
  end
  def goodbye
    puts "May the force be with you!"
  end
end
