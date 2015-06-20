#file holds main program and main class
#  note: to clear terminal screen use -  puts "\e[H\e[2J"
# require "rubygems"

require "pry"
require_relative "../db/connection"
require_relative 'rolodex'

#define a CRM class
class CRM

  def self.run
    my_crm = new
    my_crm.run
  end

  def initialize
    @crm_rolodex = Rolodex.new
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

    gets.chomp.to_i

  end

  #method to prompt for contact info; returns a hash
  def prompt_contact_info
    print "\nPlease enter your first name:"
    first_name = gets.chomp
    print "Please enter your last name:"
    last_name = gets.chomp
    print "Please enter your email:"
    email = gets.chomp
    print "Please add a note:"
    notes = gets.chomp

    {first_name: first_name, last_name: last_name, email: email, notes: notes}
  end

  # method to prompt user for contact id
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
    puts "[4] Notes"
    print "Please enter the attribute you want to search by (1 thru 4):"
    gets.chomp.to_i
  end

  def collect_attribute_value
    print "Please enter attribute value:"
    gets.chomp
  end


  def run
    while true
      menu_response = menu

      if menu_response == 1 #adding a new contact
         contact_info = prompt_contact_info
         @crm_rolodex.add_contact(contact_info)

      elsif menu_response == 2 #modify contact
        entered_id = prompt_contact_id
        while true
          attribute_type = prompt_for_attribute
          attribute_val = collect_attribute_value
          @crm_rolodex.modify_contact(entered_id, attribute_type, attribute_val)

          print "Do you want to modify another attribute? ('yes' or 'no'):"
          reply = gets.chomp
          break if reply == 'no'
        end


      elsif menu_response == 3 #display all contacts
        @crm_rolodex.display_all_contacts

      elsif menu_response == 4 #display a contact based on id
        entered_id = prompt_contact_id
        @crm_rolodex.display_particular_contact(entered_id)

      elsif menu_response == 5 #display a contact based on attribute
        attribute_type = prompt_for_attribute
        attribute_val = collect_attribute_value
        @crm_rolodex.display_info_by_attribute(attribute_type, attribute_val)

      elsif menu_response == 6 #delete a contact
        entered_id = prompt_contact_id
        @crm_rolodex.delete_contact(entered_id)
      end

      break if menu_response == 7 #exit CRM
    end
  end

end


CRM.run



