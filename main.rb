require 'csv'
require 'tty-prompt'
require 'asciiart'
require 'tty-font'
require 'smarter_csv'
# require 'tty-link'
# require 'artii'
require_relative "./inventory"
require_relative "./users_login"

def prompt
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
end
# artii = Artii::Base.new
# puts artii.asciify('S K A T E S H O P')

def goodbye
    font = TTY::Font.new(:doom)
    puts font.write("GOODBYE", letter_spacing: 1)
end

def prettys
    font = TTY::Font.new(:doom)
    puts font.write("STAFF MENU", letter_spacing: 1)
end

def pretty
    font = TTY::Font.new(:doom)
    puts font.write("MENU", letter_spacing: 1)
end

def skateshop
    puts"░██████╗██╗░░██╗░█████╗░████████╗███████╗░██████╗██╗░░██╗░█████╗░██████╗░"
    puts"██╔════╝██║░██╔╝██╔══██╗╚══██╔══╝██╔════╝██╔════╝██║░░██║██╔══██╗██╔══██╗"
    puts"╚█████╗░█████═╝░███████║░░░██║░░░█████╗░░╚█████╗░███████║██║░░██║██████╔╝"
    puts"░╚═══██╗██╔═██╗░██╔══██║░░░██║░░░██╔══╝░░░╚═══██╗██╔══██║██║░░██║██╔═══╝░"
    puts"██████╔╝██║░╚██╗██║░░██║░░░██║░░░███████╗██████╔╝██║░░██║╚█████╔╝██║░░░░░"
    puts"╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░\n\n"
end

# Start of application
def start

    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
    skateshop
    puts "Welcome to the Skate shop app!"
    welcome = prompt.select("Please log in.") do |menu|
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
       leaving
    end
    
end

# main menus for app after login successful
# user menu
def user_mainmenu
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
    pretty
    user_menu = prompt.select("Welcome to the menu") do |menu|
        menu.choice 'Show Inventory'
        menu.choice 'View pictures of Inventory'
        # menu.choice 'Add item to cart'
        menu.choice 'Exit'
    end
    if user_menu == 'View pictures of Inventory'
        # view_images
        step1  
    elsif user_menu == 'Show Inventory'
        user_inventory
    else
        leaving
    end
end

# staff menu
def staff_mainmenu
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    system("clear")
    prettys
    staff_menu = prompt.select("Menu, Staff Access") do |menu|
        menu.choice 'Show Inventory'
        menu.choice 'Create New Item'
        menu.choice 'Amend Existing Item'
        menu.choice 'Delete Existing Item'
        menu.choice 'View pictures of Inventory'
        menu.choice 'Add New Staff Member'
        menu.choice 'Exit'
    end
    if staff_menu == 'Show Inventory'
        staff_inventory
    elsif staff_menu == 'Create New Item'
        create
    elsif staff_menu == 'Amend Existing Item'
        # z_item
        amend
    elsif staff_menu == 'Delete Existing Item'
        delete 
    elsif staff_menu == 'View pictures of Inventory'
        step2
    elsif staff_menu == 'Add New Staff Member'    
        new_staff_member
    else
        system("clear")
        goodbye
        puts "Keep up the good work!!"
        exit
    end
end

def leaving
    system("clear")
    goodbye
    puts "Thanks for visiting the Skateshop"
    exit
end

puts start