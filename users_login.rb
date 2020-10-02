# all login options methods below
def new_user
    puts "What is your name?"
    print "🛹 "
    username = gets.chomp.capitalize
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

def new_staff_member
    puts "What is the Staff name?"
    print "🛹 "
    username = gets.chomp.capitalize
    system("clear")
    puts "Please enter a password"
    print "🛹 "
    password = gets.chomp
    system("clear")
    puts "Please enter Staff email"
    print "🛹 "
    email = gets.chomp
    system("clear")
    CSV.open("login.csv", "a") do |csv|
        csv << [username, password, email, "staff"]
        puts "#{username} is now in the system"
        sleep (2)
        system("clear")
    end
    staff_mainmenu
end

def user_login
    login_start
    verified(gets.chomp.capitalize)
end

def staff_login
    login_start
    verified_staff(gets.chomp.capitalize)
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
            puts "Incorrect password. Please try again"
            sleep 1
            system("clear")
            start
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
            # user_login
            start
        end
    else
    failed
    end
end

def authentication(username)
    csv = CSV.read( "login.csv", headers: true )
    csv.find {|row| row['name'] == username}
end

def failed
    puts "Username not recognised. Please try again."
    sleep(2)
    system("clear")
    start
end