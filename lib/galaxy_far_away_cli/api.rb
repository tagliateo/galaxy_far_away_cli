class APIService
  # include HTTparty

  BASE_URI = 'https://swapi.dev/api/films/'

  def self.fetch_data
    response = HTTParty.get(BASE_URI)
    film_array = JSON.parse(response.body)["results"]
      # binding.pry
    film_array.each {|film| Film.new(film)}

  end



end
