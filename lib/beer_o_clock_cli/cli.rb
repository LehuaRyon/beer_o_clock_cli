class CLI
    # only place of communication with user & data
    # welcoming user and giving option to exit
    def start
        puts ""
        puts "Hey mate! Welcome to the Beer Hub!"
        puts "Are you trying to find the next spot to grab a brewski?"
        puts "If so, what's your name?"
        API.get_data
        greet(user_input)
        # once new session of CLI is instantiated,
            # invoke & collect API data
            # then get it availiable for this app    
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts ""
        puts "We're happy to have you #{name}."
        puts ""
        puts "To look at some location options for your next drink, enter 'breweries'."
        puts "To leave the Beer Hub at any time, just enter 'exit'."
        menu
    end

    def menu
        # store a users input in variable
            # strip takes away anything before and after the entry
        choice = user_input.downcase
        # execute based off of input
        # conditional statement
        if  choice == "breweries"
            breweries_list
            menu # this way doesn't kick out user after 1 input
        elsif choice == "exit"
            goodbye
            # don't call #menu bc the point is user is exiting program 
        else
            invalid_entry
        end
    end

    def breweries_list
        puts ""
        Brewery.all.each.with_index(1) do |brewery, index|
            # iterate over @@all array and access each brewery
                # each brewery has attributes, so list by name attribute only
            # .each_with_index would start at 0, instead of the 1
            # creating incrementing numbered list, use index location of array
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                puts ""
                puts "#{index}. #{brewery.name}"
                puts ""
            end
            #puts "" # use empty strings to provide spaces
            # create 2nd layer of communication
            brewery_chosen
         
    end

    def brewery_chosen
        puts ""
        puts "Which brewery would you like details about?"
        choice = user_input
        brewery = Brewery.find_brewery(choice)
        brewery_details(brewery)
    end

    def brewery_details(brewery)
        puts "_________________________________________________"
        puts ""
        puts "Name: #{brewery.name}"
        puts "Brewery Type: #{brewery.brewery_type}"
        puts "Street: #{brewery.street}"
        puts "City: #{brewery.city}"
        puts "State: #{brewery.state}"
        puts "Postal Code: #{brewery.postal_code}"
        puts "Country: #{brewery.country}"
        puts "Phone: #{brewery.phone}"
        puts "Website Url: #{brewery.website_url}"
        puts "_________________________________________________"
        puts ""
        puts "If you would like to view your brewery options again, enter 'breweries'"
        menu
    end

    def goodbye
        puts ""
        puts "We hope to see you again soon."
        puts "Cheers!"
        # needs "puts" bc returning only returns to machine, doesn't print
    end

    def invalid_entry
        puts ""
        puts "Invalid entry, try again."
        puts "Enter 'breweries' to see a list of breweries."
        puts "Enter 'exit' to leave the Beer Hub."
        menu
        # recursion = when you call the method inside of itself
    end
end