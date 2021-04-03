class Brewery
    
    attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url

    @@all = []

    def initialize(attributes_hash)
        attributes_hash.each {|key, value| self.send("#{key}=", value) if self.respond_to?("#{key}=")}
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_brewery(brewery_name)
        self.all.find {|brewery| brewery.name.downcase == brewery_name || brewery.name == brewery_name} 
    end

end 
