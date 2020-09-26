require 'csv'

class Users
    # Giving read access to username and password
   attr_reader :username, :password
    


end


puts welcome



# CSV.foreach('login.csv') do |row|
#     puts row.inspect
#   end
# all_users = File.read("login.csv").split
# puts all_users
# p all_users