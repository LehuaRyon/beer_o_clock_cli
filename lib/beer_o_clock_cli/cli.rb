class CLI
   
    def run
        system "clear"
        start
        greet(user_input)
        menu
    end

    def user_input
        gets.strip
    end

    def start
        puts ""
        puts Rainbow("Hey mate! Welcome to the Beer Hub!").goldenrod.bright
        puts ""
        puts Rainbow("Are you trying to find the next spot to grab a brewski?").palegoldenrod
        puts Rainbow("If so, what's your name?").palegoldenrod
        API.get_data
    end

    def greet(name)
        sleep(0.5)
        if name == "exit"
            goodbye
        else
            puts ""
            puts Rainbow("We're happy to have you #{name}.").darkgoldenrod
            puts ""
            puts Rainbow("To look at some location options for your next drink, enter 'breweries'.").palegoldenrod
            puts Rainbow("To leave the Beer Hub at any time, just enter 'exit'.").palegoldenrod
        end
    end

    def menu
        choice = user_input.downcase
        if  choice == "breweries"
            breweries_list
            menu
        elsif choice == "exit"
            goodbye
        else
            invalid_entry
        end
    end

    def breweries_list
        sleep(1)
        puts ""
        Brewery.all.each.with_index(1) do |brewery, index|
                puts Rainbow("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~").saddlebrown
                puts ""
                puts Rainbow("#{index}. #{brewery.name}, #{brewery.state}").gold
                puts ""
            end
            brewery_chosen
    end

    def brewery_chosen
        sleep(0.5)
        puts ""
        puts Rainbow("Which brewery would you like details about? Please type its name:").palegoldenrod
        choice = user_input
        brewery = Brewery.find_brewery(choice)
        brewery_details(brewery)
    end

    def brewery_details(brewery)
        sleep(1)
        if  brewery
            puts Rainbow("_________________________________________________").saddlebrown
            puts ""
            puts Rainbow("Name: #{brewery.name}").lightgoldenrod.bright
            puts Rainbow("Brewery Type: #{brewery.brewery_type}").gold
            puts Rainbow("Street: #{brewery.street}").yellow
            puts Rainbow("City: #{brewery.city}").goldenrod
            puts Rainbow("State: #{brewery.state}").khaki
            puts Rainbow("Postal Code: #{brewery.postal_code}").darkkhaki
            puts Rainbow("Country: #{brewery.country}").peru
            puts Rainbow("Phone: #{brewery.phone}").darkgoldenrod
            puts Rainbow("Website Url: #{brewery.website_url}").sienna
            puts Rainbow("_________________________________________________").saddlebrown
            puts ""
            puts Rainbow("If you would like to view your brewery options again, enter 'breweries'").palegoldenrod
        elsif brewery == "exit"
            goodbye
        else
            puts ""
            puts Rainbow("Invalid entry, try again.").darkgoldenrod
            brewery_chosen
        end
    end

    def goodbye
        sleep(0.5)
        puts ""
        puts Rainbow("We hope to see you again soon.").goldenrod.bright
        puts Rainbow("Cheers!").goldenrod.bright
    end

    def invalid_entry
        puts ""
        puts Rainbow("Invalid entry, try again.").darkgoldenrod
        puts ""
        puts Rainbow("Enter 'breweries' to see a list of breweries.").palegoldenrod
        puts Rainbow("Enter 'exit' to leave the Beer Hub.").palegoldenrod
        sleep(3)
        menu
    end
end