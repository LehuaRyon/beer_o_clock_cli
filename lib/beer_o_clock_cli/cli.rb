class BeerOClockCli::CLI
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
        # menu
        puts ""
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
        # conditional statement
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

    #Brewery.all => # of breweries in array
    def breweries_list
        puts ""
        Brewery.all.each.with_index(1) do |brewery, index|
            # iterate over @@all array and access each brewery
                # each brewery has attributes, so list by name attribute only
            # .each_with_index would start at 0, instead of the 1
            # creating incrementing numbered list, use index location of array
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                puts "#{index}. #{brewery.name}"
            end
            #puts "" # use empty strings to provide spaces
            # create 2nd layer of communication
            #puts "Which brewery would you like details about?"
            #input = gets.strip.downcase
            brewery_chosen#(input)
            # if input == Brewery.find_by_name(input)
            #     brewery_chosen(input)
            # elsif input == exit
            #     goodbye
            # else
            #     puts "Please enter the brewery name:"
            #     breweries_list 
            # end
    end

    def brewery_chosen(brewery_picked)
        puts ""
        puts "Which brewery would you like details about?"
        choice = user_input
        Brewery.find_brewery(choice)
        # variable is created to store the returned brewery, so I can show user something about it
        # pass in users selection from line 42, users input 
        # going to return an array, brewery
            # iterate over array with each to print out
        brewery.each do |b|
            puts "Name: #{b.name}"
            puts "Brewery Type: #{b.brewery_type}"
            puts "Street: #{b.street}"
            puts "City: #{b.city}"
            puts "State: #{b.state}"
            puts "Postal Code: #{b.postal_code}"
            puts "Country: #{b.country}"
            puts "Phone: #{b.phone}"
            puts "Website Url: #{b.website_url}"
        end
        puts ""
        puts "If you would like to view your brewery options again, enter 'breweries'"
    end

    def goodbye
        puts ""
        puts "See you next time."
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