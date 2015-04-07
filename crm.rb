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
          entered_id = prompt_contact_id

        # As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.
        # @crm_rolodex.display_all_contacts
        #
        # @crm_rolodex.display_all_contacts

      elsif menu_response == 3 #display all contacts
        @crm_rolodex.display_all_contacts

      elsif menu_response == 4 #display a contact based on id
        entered_id = prompt_contact_id
        @crm_rolodex.display_particular_contact(entered_id)

      elsif menu_response == 5 #display a contact based on attribute
        attribute_type = prompt_for_attribute
        print "Please enter attribute value:"
        attribute_val = gets.chomp
        @crm_rolodex.display_info_by_attribute(attribute_type, attribute_val)

      elsif menu_response == 6 #delete a contact
        entered_id = prompt_contact_id
        @crm_rolodex.delete_contact(entered_id)
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
    puts "[4] Display a contact based on contact ID"
    puts "[5] Display contacts based on an Attribute"
    puts "[6] Delete a contact based on contact ID"
    puts "[7] Exit"
    print "Please enter your selection (between 1 to 7):"

    user_selection = gets.chomp.to_i

  end

  #For prompt for contact info
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

  def prompt_contact_id
    print "Enter contact I.D.:"
    while true
      contact_id = gets.chomp.to_i

      puts "You entered contact ID - #{contact_id}"
      print "Confirm ID entry ('yes' or 'no'):"
      user_contact_id_conformation = gets.chomp.downcase

      if user_contact_id_conformation == 'yes'
        return contact_id
      elsif user_contact_id_conformation == 'no'
        print "Re-enter contact I.D.:"
      else
        print "You have neither entered 'yes' or 'no'. Please re-enter contact's I.D. and try again:"
      end
    end
  end

  def prompt_for_attribute
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Note"
    print "Please enter the attribute you want to search by (1 thru 4):"
    contact_attrb = gets.chomp.to_i
  end

end


my_crm = CRM.new
my_crm.run



