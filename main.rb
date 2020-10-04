require 'csv'
require 'optparse'
require 'tty-prompt'
require 'asciiart'
require 'tty-font'
require 'smarter_csv'
require 'tty-link'
require 'artii'
require_relative "./inventory"
require_relative "./users_login"

def prompt
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
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
    pretty("WELCOME")
    sleep (2)
    system("clear")
    prompt
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
    prompt
    system("clear")
    pretty("MENU")
    user_menu = prompt.select("Welcome to the menu") do |menu|
        menu.choice 'Show Inventory'
        menu.choice 'View pictures of Inventory'
        menu.choice 'Exit'
    end
        if user_menu == 'View pictures of Inventory'
            step1  
        elsif user_menu == 'Show Inventory'
            user_inventory
        else
            leaving
        end
end

# staff menu
def staff_mainmenu
    prompt
    system("clear")
    pretty("MENU")
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
            amend
        elsif staff_menu == 'Delete Existing Item'
            delete 
        elsif staff_menu == 'View pictures of Inventory'
            step2
        elsif staff_menu == 'Add New Staff Member'    
            new_staff_member
        else
            system("clear")
            pretty("GOODBYE")
            puts "Keep up the good work!!"
            exit
        end
end

def leaving
    system("clear")
    pretty("GOODBYE")
    puts "Thanks for visiting the Skateshop"
    exit
end

# styling
def pretty(word)
    font = TTY::Font.new(:doom)
    puts font.write(word, letter_spacing: 1)
end

@options = {}

op = OptionParser.new do |opts|
    opts.on("-v", "--verbose", "show extra information") do 
        @options[:verbose] = true
    end
    opts.on("-c", "--color", "Enable syntax highlighting") do
        @options[:syntax_highlighting] = true
    end
    opts.on("-h", "--help", "Help") do
        @options[:help] = "Log into app and use direction keys to navigate menu. At times the app will ask for keyboard input. Exit anytime from a main menu."
    end
end

op.parse!

puts @options
sleep (7)
puts start