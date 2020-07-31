class Film
  attr_accessor :title, :opening_crawl, :starships, :planets

    @@all = []
    
    def initialize(attr_hash)
        attr_hash.each do |k, v|
            self.send("#{k}=", v) if self.respond_to?("#{k}=")
        end
        save
    end

    def save
      @@all << self
    end

    def self.all
      @@all
    end

    def self.find_by_name(title)
        self.all.select { |film| film.title.downcase == title.downcase}
    end

end
