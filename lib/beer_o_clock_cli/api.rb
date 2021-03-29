class API

    def self.get_data
        response = RestClient.get("https://api.openbrewerydb.org/breweries?per_page=50")
        breweries_array = JSON.parse(response.body)
        breweries_array.each do |brewery|
            Brewery.new(brewery)
        end
    end
    
end