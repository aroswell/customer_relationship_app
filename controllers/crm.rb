#file holds main program and main class
#  note: to clear terminal screen use -  puts "\e[H\e[2J"
# require "rubygems"

require "pry"
require_relative "../db/connection"
require_relative 'rolodex'
require_relative "../views/text_formatting"

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
    print "\n\n"
    puts "[1]".blue + " Add a new contact".dark_grey
    puts "[2]".blue + " Modify an existing contact".dark_grey
    puts "[3]".blue + " Display All contacts".dark_grey
    puts "[4]".blue + " Display a contact based on contact ID".dark_grey
    puts "[5]".blue + " Display contacts based on an Attribute".dark_grey
    puts "[6]".blue + " Delete a contact based on contact ID".dark_grey
    puts "[7]".blue + " Exit".dark_grey
    print "Please enter your selection (between 1 to 7):".green

    gets.chomp.to_i

  end

  #method to prompt for contact info; returns a hash
  def prompt_contact_info
    print "\nPlease enter your first name:".green
    first_name = gets.chomp
    print "Please enter your last name:".green
    last_name = gets.chomp
    print "Please enter your email:".green
    email = gets.chomp
    print "Please add a note:".green
    notes = gets.chomp

    {first_name: first_name, last_name: last_name, email: email, notes: notes}
  end

  # method to prompt user for contact id
  def prompt_contact_id
    print "\nEnter contact I.D.:".green
    while true
      contact_id = gets.chomp.to_i

      puts "You entered contact ID -".dark_grey + " #{contact_id}"
      print "Confirm ID entry ('yes' or 'no'):".yellow
      user_contact_id_conformation = gets.chomp.downcase

      if user_contact_id_conformation == 'yes'
        return contact_id
      elsif user_contact_id_conformation == 'no'
        print "Re-enter contact I.D.:".green
      else
        print "You have neither entered 'yes' or 'no'. Please re-enter contact's I.D. and try again:".red
      end
    end
  end

  def prompt_for_attribute(default = true)
    puts "[1]".blue + " First name"
    puts "[2]".blue + " Last name"
    puts "[3]".blue + " Email"
    puts "[4]".blue + " Notes"
    if default
      print "Please enter the attribute you want to search by (1 thru 4):".green
    else
      print "Please enter the attribute you want to modify by (1 thru 4):".green
    end
    gets.chomp.to_i
  end

  def collect_attribute_value
    print "\nPlease enter attribute value:".green
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
          attribute_type = prompt_for_attribute(false)
          attribute_val = collect_attribute_value

          if @crm_rolodex.modify_contact(entered_id, attribute_type, attribute_val)
            print "Do you want to modify another attribute? ('yes' or 'no'):".yellow
            reply = gets.chomp
            break if reply == 'no'
          else
            break
          end
        end

      elsif menu_response == 3 #display all contacts
        all_contacts = @crm_rolodex.display_all_contacts
        puts all_contacts

      elsif menu_response == 4 #display a contact based on id
        entered_id = prompt_contact_id
        puts @crm_rolodex.display_particular_contact(entered_id)

      elsif menu_response == 5 #display a contact based on attribute
        attribute_type = prompt_for_attribute
        attribute_val = collect_attribute_value
        puts @crm_rolodex.display_info_by_attribute(attribute_type, attribute_val)

      elsif menu_response == 6 #delete a contact
        entered_id = prompt_contact_id
        deletion = @crm_rolodex.delete_contact(entered_id)
        if deletion[:status]
          puts deletion[:contact]
        else
          puts deletion[:error].red
        end
      end

      if menu_response == 7 # exit CRM and
        print "\ec"         # clear the console screen
        break
      end

    end
  end

end


CRM.run



