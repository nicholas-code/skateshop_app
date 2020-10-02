require 'csv'
require 'tty-prompt'
require_relative "./inventory"

inventory_pull
prompt
puts "What item would you like to delete from the system?"
puts "Enter item name:"
print "🛹 "
item = gets.chomp.capitalize
data = SmarterCSV.process("inventory.csv")

data.delete_if { |row| item == row[:item] }
    CSV.open("inventory.csv", "w") do |csv| 
        csv << [:item, :price, :quantity, :link]
    end
    data.each do |row|
        CSV.open("inventory.csv", "a") do |csv| 
            csv << row.values
        end
    end



# class Users
#     # Giving read access to username and password
#     attr_reader :username, :password
#     def initialize #(username, password)
#         @username = username
#         @username = password
#     end
    

#     # end
    
# end


# class PublicUsers < Users
#     def initialize
#         super(username, password)  
#         @options = ["View Stock"]
#     end
# end
    
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

# def newuser
#     puts "What is your name?"
#     print "> "
#     username = gets.chomp
#     puts "Please enter a password"
#     print "> "
#     password = gets.chomp
#     puts "Please enter your email"
#     print "> "
#     email = gets.chomp
#     CSV.open("login.csv", "a") do |csv|
#         csv << [username, password, email, "user"]
#         puts "You are now in the system"
#     end
# end

# def user_mainmenu
#     puts "user menu"
# end

# def staff_mainmenu
#     puts "staff menu"
# end

# def user_login
#     login_start
#     verified(gets.chomp)
# end

# def login_start
#     puts "Enter username:"
#     # print "> "
# end

# def verified(input)
#     user_row = authentication(input)
#     if user_row
#         puts 'Please enter your password:'
#         print "> "
#         password = gets.chomp
#         if user_row['password'] == password
#             puts "yeah budda"
#             user_mainmenu
#          else
#             puts "Incorrect password."
#             sleep 1
#             user_login
#         end
#     else
#     failed
#     end
# end

# def authentication(username)
#     # CSV.open('login.csv', headers: true).find { |row| row['name'] == username }
#     csv = CSV.read( "login.csv", headers: true )
#     csv.find {|row| row['name'] == username}
# end

# def failed
#     puts "Username not recognised. Please try again."
#     sleep(1)
#     user_login
#     # exit
# end

# Start of application
# def start
#     prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
#     system("clear")
#     welcome = prompt.select("Welcome to the Skate shop app!") do |menu|
#     menu.choice 'New User'
#     menu.choice 'Existing User'
#     menu.choice 'Staff'
#     menu.choice 'Exit'
#     end
    
#     if welcome == 'New User'
#         newuser
#         # puts "What is your name?"
#         # username = gets.chomp
#         # puts "Please enter a password"
#         # password = gets.chomp
#         # puts "Please enter your email"
#         # email = gets.chomp
#         # CSV.open("login.csv", "a") do |csv|
#         #     csv << [username, password, email, "user"]
#         #     puts "You are now in the system"
#         end

#     elsif welcome == 'Existing User'
#         puts "What is your name?"
#         username = gets.chomp
#         csv = CSV.read( "login.csv", headers: true )
#         csv.find {|row| row['name'] == username}
#         if csv.find {|row| row['name'] == username}
#             puts "yeah nice #{username}, what is your password?"
#             password = gets.chomp
#             #fix me
                        
#         else
#             puts "nah mate, you're not in the system. Try again!"
#             exit              
#         end


#     elsif welcome == 'Staff'
#         puts "What is your name?"
#         username = gets.chomp
#         csv = CSV.read( "login.csv", headers: true )
#         csv.find {|row| row['name'] == username}
#         if csv.find {|row| row['name'] == username}
#             puts "Hello #{username}, what is your password?"
#             password = gets.chomp
#             #fix me                             
#         else
#             puts "nah mate, you're not in the system. Try again!"
#             exit              
#         end
#     else
#         puts "Seeya"
#         exit
#     end

#     #puts @options
# end
# item,price,quantity,link
# prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
# system("clear")
# inventory = CSV.read('inventory.csv', headers:true)
product_list = CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"]}, Qty= #{row["quantity"]}" }

# welcome = prompt.select("Welcome to the Skate shop app!") do |menu|
#     inventory.each do |product|
#     menu.choice(row['item'])
#     end
# end
# puts welcome
# puts inventory
# puts csv
# puts inventory
# puts start
# puts user_login
# def load_product_list
#     products = {}
#     # open/read csv database
#     File.open('product_list.csv').each do |line|
#         product = line.chomp.split(",")
#         products.store(product[0], Product.new(product[0], product[1], product[2], product[3]))
#     end
#     return products
# end
# puts load_product_list


# general ascii art
# def render_ascii_art
#   File.readlines("skate.txt") do |line|
#     puts line
#   end
# end