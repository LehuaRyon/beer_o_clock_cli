class CLI
   
    def run
        system "clear"
        start
        menu
        # while menu != 'exit'
        # end
        #goodbye
        # if the instance methods do not return exit, keep going, if does, execute goodbye method to end program
    end

    def start
        puts ""
        puts "Hey mate! Welcome to the Beer Hub!"
        puts "Are you trying to find the next spot to grab a brewski?"
        puts "If so, what's your name?"
        API.get_data
        greet(user_input) 
    end

    def user_input
        gets.strip
    end

    def greet(name)
        sleep(0.5)
        puts ""
        puts "We're happy to have you #{name}."
        puts ""
        puts "To look at some location options for your next drink, enter 'breweries'."
        puts "To leave the Beer Hub at any time, just enter 'exit'."
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
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                puts ""
                puts "#{index}. #{brewery.name}"
                puts ""
            end
            brewery_chosen
    end

    def brewery_chosen
        sleep(1)
        puts ""
        puts "Which brewery would you like details about?"
        choice = user_input
        brewery = Brewery.find_brewery(choice)
        brewery_details(brewery)
    end

    def brewery_details(brewery)
        sleep(1)
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
        #menu
    end

    def goodbye
        sleep(0.5)
        puts ""
        puts "We hope to see you again soon."
        puts "Cheers!"
    end

    def invalid_entry
        puts ""
        puts "Invalid entry, try again."
        puts "Enter 'breweries' to see a list of breweries."
        puts "Enter 'exit' to leave the Beer Hub."
        sleep(3)
        menu
    end
end