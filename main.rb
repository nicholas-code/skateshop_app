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
end
    
# class NewUser < Users
#     def initialize
#         super(username, password)
#     end
        
#     def input
#         puts "What is your name?"
#         @username = gets.chomp
#         puts "Please make a password!"
#         @password = gets.chomp
#     end
# end

# main menus for app after login successful
def user_mainmenu
    puts "user menu"
end

def staff_mainmenu
    puts "staff menu"
end

# all login options methods below
def new_user
    puts "What is your name?"
    print "🛹 "
    username = gets.chomp
    system("clear")
    puts "Please enter a password"
    print "🛹 "
    password = gets.chomp
    system("clear")
    puts "Please enter your email"
    print "🛹 "
    email = gets.chomp
    system("clear")
    CSV.open("login.csv", "a") do |csv|
        csv << [username, password, email, "user"]
        puts "You are now in the system"
        sleep (2)
        system("clear")
    end
    user_mainmenu
end

def user_login
    login_start
    verified(gets.chomp)
end

def staff_login
    login_start
    verified_staff(gets.chomp)
end

def login_start
    puts "Enter name:"
    print "🛹 "
end

def verified(input)
    user_row = authentication(input)
    system("clear")
    if user_row
        puts 'Please enter your password:'
        print "🛹 "
        password = gets.chomp
        if user_row['password'] == password
            system("clear")
            puts "yeah budda"
            sleep(2)
            system("clear")
            user_mainmenu
         else
            puts "Incorrect password."
            sleep 1
            system("clear")
            user_login
        end
    else
    failed
    end
end

def verified_staff(input)
    user_row = authentication(input)
    system("clear")
    if user_row['type'] == "staff"        
        puts 'Please enter your password:'
        print "🛹 "
        password = gets.chomp
        if user_row['password'] == password
            system("clear")
            puts "Do some work m8"
            sleep(2)
            system("clear")
            staff_mainmenu
        else
            puts "Incorrect password."
            sleep 1
            system("clear")
            user_login
        end
    else
    failed
    end
end


def authentication(username)
    # CSV.open('login.csv', headers: true).find { |row| row['name'] == username }
    csv = CSV.read( "login.csv", headers: true )
    csv.find {|row| row['name'] == username}
end

def failed
    puts "Username not recognised. Please try again."
    sleep(1)
    system("clear")
    start
    # exit
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
        new_user

    elsif welcome == 'Existing User'
        user_login
        # puts "What is your name?"
        # username = gets.chomp
        # csv = CSV.read( "login.csv", headers: true )
        # csv.find {|row| row['name'] == username}
        # if csv.find {|row| row['name'] == username}
        #     puts "yeah nice #{username}, what is your password?"
        #     password = gets.chomp
        # else
        #     puts "nah mate, you're not in the system. Try again!"
        #     exit              
        # end
            
    elsif welcome == 'Staff'
        staff_login
        # puts "What is your name?"
        # username = gets.chomp
        # csv = CSV.read( "login.csv", headers: true )
        # csv.find {|row| row['name'] == username}
        # if csv.find {|row| row['name'] == username}
        #     puts "Hello #{username}, what is your password?"
        #     password = gets.chomp
        #     #fix me                             
        # else
        #     puts "nah mate, you're not in the system. Try again!"
        #     exit              
        # end
    else
        puts "Seeya mate"
        exit
    end

end

puts start






# CSV.foreach('login.csv') do |row|
#     puts row.inspect
#   end
# all_users = File.read("login.csv").split
# puts all_users
# p all_users