require 'csv'
require 'tty-prompt'
require 'tty-link'
require 'asciiart'
require 'tty-font'
require 'smarter_csv'
# require 'artii'
require_relative "./inventory"
require_relative "./users_login"

def prompt
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
end
# artii = Artii::Base.new
# puts artii.asciify('S K A T E S H O P')
# Start of application
def start

    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
        
puts"░██████╗██╗░░██╗░█████╗░████████╗███████╗░██████╗██╗░░██╗░█████╗░██████╗░"
puts"██╔════╝██║░██╔╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║░░██║██╔══██╗██╔══██╗"
puts"╚█████╗░█████═╝░███████║░░░██║░░░█████╗░░╚█████╗░███████║██║░░██║██████╔╝"
puts"░╚═══██╗██╔═██╗░██╔══██║░░░██║░░░██╔══╝░░░╚═══██╗██╔══██║██║░░██║██╔═══╝░"
puts"██████╔╝██║░╚██╗██║░░██║░░░██║░░░███████╗██████╔╝██║░░██║╚█████╔╝██║░░░░░"
puts"╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░\n\n"
    # font = TTY::Font.new(:doom)
    # puts font.write("SKATESHOP", letter_spacing: 2)
    welcome = prompt.select("Welcome to the Skate shop app!") do |menu|
        menu.choice 'Staff'
        menu.choice 'New User'
        menu.choice 'Existing User'
        menu.choice 'Exit'
    end
    
    if welcome == 'New User'
        new_user

    elsif welcome == 'Existing User'
        user_login
        
    elsif welcome == 'Staff'
        staff_login
        
    else
        puts "Seeya mate"
        exit
    end
    
end

# main menus for app after login successful
# user menu
def user_mainmenu
    # puts "user menu"
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
    user_menu = prompt.select("Welcome to the menu") do |menu|
        menu.choice 'Show Inventory'
        menu.choice 'View pictures of Inventory'
        # menu.choice 'Add item to cart'
        menu.choice 'Exit'
    end
    if user_menu == 'View pictures of Inventory'
        view_images
        
    elsif user_menu == 'Show Inventory'
        user_inventory
    else
        puts "Seeya mate"
        exit
    end
end

# staff menu
def staff_mainmenu
    # puts "staff menu"
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
    staff_menu = prompt.select("Menu, Staff Access") do |menu|
        menu.choice 'Create New Item'
        menu.choice 'Show Inventory'
        menu.choice 'Amend Existing Item'
        menu.choice 'Delete Existing Item'
        menu.choice 'Add New Staff Member'
        menu.choice 'Exit'
    end
    if staff_menu == 'Create New Item'
        create
        
    elsif staff_menu == 'Show Inventory'
        staff_inventory
        
    elsif staff_menu == 'Amend Existing Item'
        amend
        
    elsif staff_menu == 'Delete Existing Item'
        delete 
       
    elsif staff_menu == 'Add New Staff Member'    
        new_staff_member
    else
        puts "Seeya mate"
        exit
    end
end


# puts render_ascii_art
puts start
# puts render_ascii_art
# puts TTY::Link.link_to("Skateboard", "https://www.shutterstock.com/image-photo/skateboard-isolated-278686073")
# puts "https://www.shutterstock.com/image-photo/skateboard-isolated-278686073"





# CSV.foreach('login.csv') do |row|
#     puts row.inspect
#   end
# all_users = File.read("login.csv").split
# puts all_users
# p all_users

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

# general ascii art
# def render_ascii_art
#   File.readlines("skate.txt") do |line|
#     puts line
#   end
# end

# puts"░██████╗██╗░░██╗░█████╗░████████╗███████╗░██████╗██╗░░██╗░█████╗░██████╗░"
# puts"██╔════╝██║░██╔╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║░░██║██╔══██╗██╔══██╗"
# puts"╚█████╗░█████═╝░███████║░░░██║░░░█████╗░░╚█████╗░███████║██║░░██║██████╔╝"
# puts"░╚═══██╗██╔═██╗░██╔══██║░░░██║░░░██╔══╝░░░╚═══██╗██╔══██║██║░░██║██╔═══╝░"
# puts"██████╔╝██║░╚██╗██║░░██║░░░██║░░░███████╗██████╔╝██║░░██║╚█████╔╝██║░░░░░"
# puts"╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░\n\n"