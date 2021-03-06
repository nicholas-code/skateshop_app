require 'asciiart'

# staff inventory options
def inventory_pull
    CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"]}, Qty= #{row["quantity"]}" }
end

def staff_inventory
    prompt
    inventory_pull
    back_to_menu_staff
end

def back_to_menu_staff
    b = prompt.select("Back to menu?") do |menu|
        menu.choice "Yes"
        menu.choice "No"
    end
        if b == "Yes"
            staff_mainmenu
        else
            exit
        end
end

def back_to_menu_user
    b = prompt.select("Back to menu?") do |menu|
        menu.choice "Yes"
        menu.choice "No"
    end
        if b == "Yes"
            user_mainmenu
        else
            system("clear")
            leaving
        end
end

def overwrite
    CSV.open("inventory.csv", "w") do |csv| 
        csv << [:item, :price, :quantity, :link]
    end
end

def amend
    CSV.foreach("inventory.csv", headers: true) { |row| puts "#{row["item"]} - $#{row["price"]}, Qty= #{row["quantity"]}, Link= #{row["link"]}" }
    puts "What item would you like to amend"
    puts "Enter item name:"
    print "🛹 "
    item = gets.chomp.capitalize
    csv = CSV.read( "inventory.csv", headers: true )
    item_row = csv.find {|row| row['item'] == item}
    prompt
    begin
        if item_row['item']
                option = prompt.select("what would you like to amend with this item?") do |menu|
                    menu.choice 'Item name'
                    menu.choice 'Price'
                    menu.choice 'Quantity'
                    menu.choice 'Picture'
                    menu.choice 'Abort'
                end
        else
            "Item not listed, try again."
            staff_mainmenu
        end
    rescue ArgumentError, TypeError, NoMethodError, Errno::ENOENT
        puts "Item not listed or type error.... Please try again"
        sleep (3)
        staff_mainmenu
    end

    if option == 'Item name'
        puts "What would you like to change the item name to?"
        print "🛹 "
        change = gets.chomp.capitalize
        p change
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
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
    staff_mainmenu


    elsif option == 'Price'
        puts "What would you like to change item price to?"
        print "🛹 $"
        change = gets.chomp
            begin
                change = Integer(change)
                data = SmarterCSV.process("inventory.csv")
                data.each_with_index do |row, index|
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
            rescue ArgumentError, TypeError
                puts "Invalid input."
                puts "Please try again."    
                sleep (3)
                    staff_mainmenu
                end
            staff_mainmenu
        
    elsif option == 'Quantity'
        puts "What would you like to change item quantity to?"
        print "🛹 "
        change = gets.chomp
            begin
                change = Integer(change)
                data = SmarterCSV.process("inventory.csv")
                data.each_with_index do |row, index|
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
            rescue ArgumentError, TypeError
                puts "Invalid input."
                puts "Please try again."    
                sleep (3)
                staff_mainmenu
            end
        staff_mainmenu

    elsif option == 'Picture'
        puts "What would you like to change the items picture file link to?"
        print "🛹 "
        change = gets.chomp
        data = SmarterCSV.process("inventory.csv")
        data.each_with_index do |row, index|
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
        staff_mainmenu
    else
        back_to_menu_staff
    end
    
end

def delete
    inventory_pull
    prompt
    puts "What item would you like to delete from the system?"
    puts "Enter item name:"
    print "🛹 "
    item = gets.chomp.capitalize
    csv = CSV.read( "inventory.csv", headers: true )
    item_row = csv.find {|row| row['item'] == item}
    begin
        if item_row['item']
            vanish = prompt.select("Are you absolutely sure you want to delete #{item}?") do |menu|
                menu.choice 'Yes'
                menu.choice 'No'
            end
        else
            "Item not listed, try again."
            staff_mainmenu
        end
    rescue ArgumentError, TypeError, NoMethodError, Errno::ENOENT
        puts "Item not listed or type error.... Please try again"
        sleep (3)
        staff_mainmenu
    end

        if vanish == 'Yes' 
            data = SmarterCSV.process("inventory.csv")
            data.delete_if { |row| item == row[:item] }
            overwrite
            data.each do |row|
                CSV.open("inventory.csv", "a") do |csv| 
                    csv << row.values
                end
            end
            staff_mainmenu
        else
            puts "Item has not been deleted"
            staff_mainmenu
        end
end

def create
    begin
    puts "What is the item name?"
    print "🛹 "
    item = gets.chomp.capitalize
    system("clear")
    puts "Enter price of item"
    print "🛹 $"
    price = gets.chomp
    price = Integer(price)
    system("clear")
    puts "Enter quantity of item"
    print "🛹 "
    quantity = gets.chomp
    quantity = Integer(quantity)
    rescue ArgumentError, TypeError
    puts "Invalid input."
    puts "Please try again."    
    sleep (3)
    create
    end
    system("clear")
    puts "Item added to system"
    sleep(2)
    puts "If you have an image for this item"
    sleep(2)
    puts "please copy it to the inv_pictures folder inside src"
    sleep(2)
    puts "then use the amend item option and add the file path please."
    sleep(6)
    CSV.open("inventory.csv", "a") do |csv|
        csv << [item, price, quantity, "picture_needed"]
        system("clear")
    end
    staff_mainmenu
end

#staff image view starting point
def step2
    inventory_pull
    puts "What item would you like to view?"
    puts "Enter item name:"
    print "🛹 "
    pic(gets.chomp.capitalize)
end

def pic(input)
    item_row = picture(input)
    system("clear")
    begin
        if item_row['link']
            a = AsciiArt.new("#{item_row['link']}")
            puts a.to_ascii_art(width:80, color:true)
            
        else
            puts "Sorry no picture available for that item"
            sleep (2)
        end
    rescue ArgumentError, TypeError, NoMethodError, Errno::ENOENT
        puts "Sorry no picture available for that item"
        sleep (2) 
    end
    view = prompt.select("Would you like to view another?") do |menu|
        menu.choice 'Yes'
        menu.choice 'No'
    end
        if view == 'Yes'
            system("clear")
            step2
        else
            staff_mainmenu
        end   
end   

#user inventory options
def user_inventory
    inventory_pull
    back_to_menu_user
end

def userpic(input)
    item_row = picture(input)
    system("clear")
    begin
        if item_row['link']
            a = AsciiArt.new("#{item_row['link']}")
            puts a.to_ascii_art(width:80, color:true)
        else
            puts "sorry no picture available"
            sleep (2) 
        end 
    rescue ArgumentError, TypeError, NoMethodError, Errno::ENOENT
        puts "Sorry no picture available for that item"
        sleep (2)    
    end 
    view = prompt.select("Would you like to view another?") do |menu|
        menu.choice 'Yes'
        menu.choice 'No'
    end
        if view == 'Yes'
            system("clear")
            step1
        else
            user_mainmenu
        end 
end

def picture(item)
    csv = CSV.read( "inventory.csv", headers: true )
    csv.find {|row| row['item'] == item}
end        

# user image view starting point
def step1
    inventory_pull
    puts "What item would you like to view?"
    puts "Enter item name:"
    print "🛹 "
    userpic(gets.chomp.capitalize)
end
