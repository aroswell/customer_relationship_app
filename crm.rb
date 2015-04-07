#file holds main program and main class
#  note: to clear terminal screen use -  puts "\e[H\e[2J"

require_relative 'contact'
require_relative 'rolodex'

#declare a CRM class
class CRM

  def initialize
    @crm_rolodex = Rolodex.new
  end

  #menu method
  def run
    while true
      menu_response = menu

      if menu_response == 1 #adding a new contact

         # contact_info = prompt_contact_info
         contact_info = ["David", "Banner", "banner.d@hulk.com", "Turns green with anger not envy"]
         new_contact = Contact.new(contact_info[0], contact_info[1], contact_info[2], contact_info[3])
         @crm_rolodex.add_contact(new_contact)

      elsif menu_response == 2 #modify contact

        # @crm_rolodex.display_all_contacts
        # @crm_rolodex.delete_contact(1001)
        # @crm_rolodex.display_all_contacts

      elsif menu_response == 3 #Display all contacts
        @crm_rolodex.display_all_contacts

      elsif menu_response == 4 #display a contact based on id
        @crm_rolodex.delete_contact(1001)

      elsif menu_response == 5 #display attribute of a contact

      elsif menu_response == 6 #delete a contact

      end


      break if menu_response == 7 #exit CRM
    end
  end


  #menu method
  def menu
    # puts "\e[H\e[2J"
    print "\n"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Display All contacts"
    puts "[4] Display a contact"
    puts "[5] Display Attribute of a contact"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    print "Please enter your selection (between 1 to 7):"

    user_selection = gets.chomp.to_i

  end

  #For prompt for contact info method
  def prompt_contact_info

    print "\nPlease enter your first name:"
    contact_fst_nm = gets.chomp
    print "Please enter your last name:"
    contact_lst_nm = gets.chomp
    print "Please enter your email:"
    contact_eml = gets.chomp
    print "Please add a note:"
    contact_nt = gets.chomp

    [contact_fst_nm, contact_lst_nm, contact_eml, contact_nt]

  end

  #For MODIFY method
  #call method prompt_contact_id
  def prompt_contact_id
    print "Enter contact ID:"
    contact_id = gets.chomp.to_i

    puts "You entered contact ID - #{contact_id}"
    print "Confirm ID entry ('yes' or 'no'):"
    user_contact_id_conformation = gets.chomp.downcase

    if user_contact_id_conformation == 'yes'
      #call method to prompt user to select attribute to be modified
    else
      #return to main menu
    end
  end

  # As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.



  #For DISPLAY ALL method
    # Show all contacts in rolodex with contact id

  #For DISPLAY A CONTACT method
    # call method to prompt user for contact id
    # then display contact's info

  #For DISPLAY ATTRIBUTE method
  def prompt_display_attr
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Note"
    print "Please enter the attribute you want to search by (1 thru 4):"
    contact_attrb = gets.chomp.to_i
  end

    # call search method with arguments attribute and value

    # display search results

  #DELETE A CONTACT
    #call method prompt_contact_id
    #search rolodex and delete contact per id

  # EXIT program
  # probably use break or exit command in the main program loop
end


my_crm = CRM.new
my_crm.run



