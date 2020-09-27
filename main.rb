require 'csv'
require 'tty-prompt'

class Users
    # Giving read access to username and password
    attr_reader :username, :password
    def initialize #(username, password)
        @username = username
        @username = password
    end
    

    # end
    
end


class PublicUsers < Users
    def initialize
        super(username, password)  
        @options = ["View Stock"]
    end
    
    class NewUser < Users
        def initialize
            super(username, password)
        end
        
        def input
            puts "What is your name?"
            @username = gets.chomp
            puts "Please make a password!"
            @password = gets.chomp
        end
        
    end
end

    # Start of application
    def start
        prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
        system("clear")
        welcome = prompt.select("Welcome to the Skate shop app!") do |menu|
        menu.choice 'New User'
        menu.choice 'Existing User'
        menu.choice 'Staff'
        menu.choice 'Exit'
        end
    
        if welcome == 'New User'
            puts "What is your name?"
            username = gets.chomp
            puts "Please enter a password"
            password = gets.chomp
            puts "Please enter your email"
            email = gets.chomp
            CSV.open("login.csv", "a") do |csv|
                csv << [username, password, email, "user"]
                puts "You are now in the system"
            end

        elsif welcome == 'Existing User'
            puts "What is your name?"
            username = gets.chomp
            csv = CSV.read( "login.csv", headers: true )
            csv.find {|row| row['name'] == username}
            if csv.find {|row| row['name'] == username}
                puts "yeah nice #{username}, what is your password?"
                password = gets.chomp
                #fix me
                           
            else
                puts "nah mate, you're not in the system. Try again!"
                exit              
            end


        elsif welcome == 'Staff'
            puts "What is your name?"
            username = gets.chomp
            csv = CSV.read( "login.csv", headers: true )
            csv.find {|row| row['name'] == username}
            if csv.find {|row| row['name'] == username}
                puts "Hello #{username}, what is your password?"
                password = gets.chomp
                #fix me                             
            else
                puts "nah mate, you're not in the system. Try again!"
                exit              
            end
        else
            puts "Seeya"
            exit
        end
    
        #puts @options
    end

puts start
# CSV.foreach('login.csv') do |row|
#     puts row.inspect
#   end
# all_users = File.read("login.csv").split
# puts all_users
# p all_users