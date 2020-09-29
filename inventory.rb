# asciiart

# a = AsciiArt.new("girlskate.jpg")
# b = AsciiArt.new("wheel.jpg")
#   => #<AsciiArt:0x007fa889cbacf8 @data="...">
#  puts a.to_ascii_art(width:75, color:true)
#  puts b.to_ascii_art(width:75, color:true)


# staff inventory options

def inventory_pull
    # inventory = CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"].capitalize}, Qty= #{row["quantity"]}" }
    # puts inventory 
    CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"].capitalize}, Qty= #{row["quantity"]}" }
end

def staff_inventory
    prompt = TTY::Prompt.new(symbols: {marker: '🛹'})
    puts "inventory will be here"
    back_to_menu
end

def back_to_menu
    b = prompt.select("Back to menu?") do |menu|
        menu.choice "yeah"
        menu.choice "nah"
    end
        if b == "yeah"
            staff_mainmenu
        else
            exit
        end
end

def amending(item_option)
    # CSV.open('login.csv', headers: true).find { |row| row['name'] == username }
    csv = CSV.read( "login.csv", headers: true )
    csv.find {|row| row['item'] == item_option}
end

def amend
    inventory_pull
    prompt
    puts "What item would you like to amend"
    puts "Enter item name:"
    print "🛹 "
    amending(gets.chomp) 
    option = prompt.select("what would you like to amend with this item?") do |menu|
        menu.choice 'Item name'
        menu.choice 'Price'
        menu.choice 'Quantity'
        menu.choice 'Picture'
        menu.choice 'Abort'
    end

    if option == 'Item name'
        

    elsif option == 'Price'
        
        
    elsif option == 'Quantity'

    elsif option == 'Picture'
        
    else
        back_to_menu
    end
    
end

def delete
    staff_inventory
    puts " delete it will come here"
end

def create
    puts "What is the item name?"
    print "🛹 "
    item = gets.chomp
    system("clear")
    puts "Enter price of item"
    print "🛹 $"
    price = gets.chomp
    system("clear")
    puts "Enter quantity of item"
    print "🛹 "
    quantity = gets.chomp
    system("clear")
    # puts "Add image of item"
    #dont know how will do this bit
    CSV.open("inventory.csv", "a") do |csv|
        csv << [item, price, quantity, "picture"]
        puts "Item added to system"
        sleep (2)
        system("clear")
    end
    staff_mainmenu
end


#user inventory options
def user_inventory
    inventory_pull
end

def view_images
    inventory_pull
    puts
end