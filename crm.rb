#file holds main program and main class

require_relative 'contact'
require_relative 'rolodex'

#menu method
puts "[1] Add a new contact"
puts "[2] Modify an existing contact"
puts "[3] Display All contacts"
puts "[4] Display a contact"
puts "[5] Display Attribute of a contact"
puts "[6] Delete a contact"
puts "[7] Exit"
print "\nPlease enter your selection (between 1 to 7):"
user_input = gets.chomp.to_i


#For ADD method
print "Please enter your first name:"
contact_fst_nm = gets.chomp
print "Please enter your last name:"
contact_lst_nm = gets.chomp
print "Please enter your email:"
contact_eml = gets.chomp
print "Please add a note:"
contact_nt = gets.chomp

#For MODIFY method
#call method prompt_contact_id
  print "Enter contact ID:"
  contact_id = gets.chomp.to_i

  puts "You entered contact ID - #{contact_id}"
  print "Confirm ID entry ('yes' or 'no'):"
  user_contact_id_conformation = gets.chomp.downcase

if user_contact_id_conformation == 'yes'
  #call ADD method
else
  #return to main menu
end

# As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.



#For DISPLAY ALL method
  # Show all contacts in rolodex with contact id

#For DISPLAY A CONTACT method
  # call method to prompt user for contact id
  # then display contact's info

#For DISPLAY ATTRIBUTE method
  puts "[1] First name"
  puts "[2] Last name"
  puts "[3] Email"
  puts "[4] Note"
  print "Please enter the attribute you want to search by (1 thru 4):"
  contact_attrb = gets.chomp.to_i

  # call search method with arguments attribute and value

  # display search results

#DELETE A CONTACT
  #call method prompt_contact_id
  #search rolodex and delete contact per id

# EXIT program
# probably use break or exit command in the main program loop


