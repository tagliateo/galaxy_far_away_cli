class APIService
  # include HTTparty

  BASE_URI = 'https://swapi.dev/api/'

  def self.fetch_data
    response = RestClient.get(BASE_URI.concat('films/'))
    film_array = JSON.parse(response.body)["results"]
      # binding.pry
    film_array.each do |film| 
      Film.new(film)
    end
    # binding.pry
  end

  # def fetch_species_data
  #   response = HTTParty.get(BASE_URI.concat('species/'))
  #   species_array = JSON.parse(response.body)["results"]
  #   species_array.each {|specie| Film.new(specie)}
  # end


end
