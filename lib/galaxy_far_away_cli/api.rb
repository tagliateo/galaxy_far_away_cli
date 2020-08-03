class APIService

  BASE_URI = 'https://swapi.dev/api/'

   #make requests, parses, and creates new films
  def self.fetch_data
    response = HTTParty.get(BASE_URI.concat('films/'))
    film_array = JSON.parse(response.body)["results"]
      # binding.pry
    film_array.each do |film|
      Film.new(film)
    end
    # binding.pry
  end

  #make requests, parses, and creates new species
  def self.fetch_species_data
    response = HTTParty.get(BASE_URI.concat('species/'))
    species_array = JSON.parse(response.body)["results"]
    # binding.pry
    species_array.each do |species|
      Species.new(species)
    end
  end
  

end
