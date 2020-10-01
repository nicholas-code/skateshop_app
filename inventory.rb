require 'asciiart'

# staff inventory options
def inventory_pull
    # inventory = CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"].capitalize}, Qty= #{row["quantity"]}" }
    # puts inventory 
    CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"]}, Qty= #{row["quantity"]}" }
end

def staff_inventory
    prompt
    inventory_pull
    back_to_menu_staff
end

def back_to_menu_staff
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

def back_to_menu_user
    b = prompt.select("Back to menu?") do |menu|
        menu.choice "yeah"
        menu.choice "nah"
    end
        if b == "yeah"
            user_mainmenu
        else
            exit
        end
end

def overwrite
    CSV.open("inventory.csv", "w") do |csv| 
        csv << [:item, :price, :quantity, :link]
    end
end

# def amending(item_option)
#     # CSV.open('login.csv', headers: true).find { |row| row['name'] == username }
#     csv = CSV.read( "login.csv", headers: true )
#     csv.find {|row| row['item'] == item_option}
# end

def amend
    inventory_pull
    prompt
    puts "What item would you like to amend"
    puts "Enter item name:"
    print "🛹 "
    item = gets.chomp.capitalize
    option = prompt.select("what would you like to amend with this item?") do |menu|
        menu.choice 'Item name'
        menu.choice 'Price'
        menu.choice 'Quantity'
        menu.choice 'Picture'
        menu.choice 'Abort'
    end

    if option == 'Item name'
        puts "What would you like to change item name to?"
        print "🛹 "
        change = gets.chomp.capitalize
        p change
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
            # p row[:item]
            if item == row[:item]
                data[index] = {
                    item: change,
                    price: row[:price],
                    quantity: row[:quantity],
                    link: row[:link],
                
                }
            end        
        end
        overwrite
        data.each do |row|
            CSV.open("inventory.csv", "a") do |csv| 
                csv << row.values
            end
        end


    elsif option == 'Price'
        puts "What would you like to change item price to?"
        print "🛹 $"
        change = gets.chomp
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
            # p row[:item]
            if item == row[:item]
                data[index] = {
                    item: row[:item],
                    price: change,
                    quantity: row[:quantity],
                    link: row[:link],
                
                }
            end        
        end
        overwrite
        data.each do |row|
            CSV.open("inventory.csv", "a") do |csv| 
                csv << row.values
            end
        end
        
    elsif option == 'Quantity'
        puts "What would you like to change item quantity to?"
        print "🛹 "
        change = gets.chomp
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
            # p row[:item]
            if item == row[:item]
                data[index] = {
                    item: row[:item],
                    price: row[:price],
                    quantity: change,
                    link: row[:link],
                
                }
            end        
        end
        overwrite
        data.each do |row|
            CSV.open("inventory.csv", "a") do |csv| 
                csv << row.values
            end
        end

    elsif option == 'Picture'
        puts "What would you like to change item picture to?"
        print "🛹 "
        change = gets.chomp
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
            # p row[:item]
            if item == row[:item]
                data[index] = {
                    item: row[:item],
                    price: row[:price],
                    quantity: row[:quantity],
                    link: change,
                
                }
            end        
        end
        overwrite
        data.each do |row|
            CSV.open("inventory.csv", "a") do |csv| 
                csv << row.values
            end
        end
    else
        back_to_menu
    end
    
end

def delete
    inventory_pull
    prompt
    puts "What item would you like to amend"
    puts "Enter item name:"
    print "🛹 "
    item = gets.chomp.capitalize
    vanish = prompt.select("Are you absolutely sure you want to delete #{item}?") do |menu|
        menu.choice 'Yes'
        menu.choice 'No'
    end
    if vanish == 'Yes' 
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
            # p row[:item]
            if item == row[:item]
                p item
            end        
        end
        overwrite
        data.each do |row|
            CSV.open("inventory.csv", "a") do |csv| 
                csv << row.values
            end
        end

    else
        staff_mainmenu
    end
  
end

def create
    puts "What is the item name?"
    print "🛹 "
    item = gets.chomp.capitalize
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
    back_to_menu_user
end

# def view_images
#     inventory_pull
#     puts "What item would you like to view?"
#     puts "Enter item name:"
#     print "🛹 "
#     option = gets.chomp.capitalize
#     data = SmarterCSV.process("inventory.csv")
#     data.each_with_index do |row, index|
#         if option == row[:item]
#         puts "this is #{row[:link]}"
#         pic = AsciiArt.new(row[:link])
#         puts pic
            
#         end
#     end
# end

def pic(input)
    user_row = picture(input)
    system("clear")
    a = AsciiArt.new("#{user_row['link']}")
    puts a.to_ascii_art(width:75, color:true)
end

def step1
    step2
    pic(gets.chomp.capitalize)
end

def step2
    inventory_pull
    puts "What item would you like to view?"
    puts "Enter item name:"
    print "🛹 "
end
def picture(item)
    # CSV.open('login.csv', headers: true).find { |row| row['name'] == username }
    csv = CSV.read( "inventory.csv", headers: true )
    csv.find {|row| row['item'] == item}
end        