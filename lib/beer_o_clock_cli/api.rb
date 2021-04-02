class API

    def self.get_data
        response = RestClient.get("https://api.openbrewerydb.org/breweries?by_state=california&per_page=50")
        breweries_array = JSON.parse(response).each{|brewery| Brewery.new(brewery)}
    end
    
end