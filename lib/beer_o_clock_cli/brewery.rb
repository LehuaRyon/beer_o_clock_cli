class Brewery
    
    attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url

    @@all = []

    def initialize(brewery_hash)
        brewery_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_brewery(brewery_name)
        self.all.find do |brewery|
            brewery.name == brewery_name  
        end
    end
end