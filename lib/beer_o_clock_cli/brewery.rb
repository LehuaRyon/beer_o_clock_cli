# model object
class Brewery
    # creating getters & setters for each property that I'm getting from API call
    attr_accessor :name, :brewery_type, :street, :city, :state, :postal_code, :country, :phone, :website_url

    # a way to save each brewery made
    @@all = []

    # def initialize(name, brewery_type, street, city, state, postal_code, country, phone, website_url)
    #     @name = name
    #     @brewery_type = brewery_type
    #     @street = street
    #     @city = city
    #     @state = state
    #     @postal_code = postal_code
    #     @country = country
    #     @phone = phone
    #     @website_url = website_url
    # end

    #initializing using mass assignment
    def initialize(attr_hash)
        attr_hash.each do |key, value|
            # using send method to create whats above (instance variables, keys, values)
            # if key exits, lets create it
                # bc the hash gives more attributes than I want to use in app
                # ignore attributes w/o setters& getters
                    # this customizes data I'm actually using
            # setting each key to its value        
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        # new brewery objects get stored in @@all array
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        # iterate over brewery array, #find to find brewery selected by name
        self.all.select do |brewery|
            brewery.name.downcase == name
        end
    end
end