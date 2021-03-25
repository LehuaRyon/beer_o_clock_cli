# call out to external API and consuming it
class API
    # turn incoming data into a ruby object
    # instantiate new brewery with recieved data from API
    def self.get_data
        # call out API endpoint to collect all breweries, submit request to get data
        response = RestClient.get("https://api.openbrewerydb.org/breweries")
        #binding.pry
        # use JSON. parse response's string body (things over the internet communicate in strings, not hashes & arrays) and return value of results key as array
        breweries_array = JSON.parse(response.body)
        # instantiate a new brewery object with each brewery from array
        breweries_array.each do |brewery|
            Brewery.new(brewery)
            # instantiate ruby objects with the data gathered from backend
            # above, brewery = hash of attributes, when i iterate over breweries_array
        end
    end

end