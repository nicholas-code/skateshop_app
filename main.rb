require 'csv'
require 'tty-prompt'

class Users
    # Giving read access to username and password
    attr_reader :username, :password
    def initialize #(username, password)
        @username = username
        @username = password
    end
end

# class WelcomeOptions

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
            puts 'ddd'
        elsif welcome == 'Existing User'
            puts 'ddds'
        elsif welcome == 'Staff'
            puts 'hhh'
        else
            puts "Seeya"
            exit
        end

        #puts @options
    end
# end

class Public Users < Users
    def initialize(username, password)
        super(username, password)  
        @options = ["View Stock", ]
    end

puts start

end
# CSV.foreach('login.csv') do |row|
#     puts row.inspect
#   end
# all_users = File.read("login.csv").split
# puts all_users
# p all_users