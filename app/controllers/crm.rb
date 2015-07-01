# file holds main program and main class
# require "rubygems"


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
    puts "[4]".blue + " Display a contact based on contact I.D.".dark_grey
    puts "[5]".blue + " Display contacts based on an Attribute".dark_grey
    puts "[6]".blue + " Delete a contact based on contact I.D.".dark_grey
    puts "[7]".blue + " Exit".dark_grey
    print "Please enter your selection (between 1 to 7):".green

    gets.chomp.to_i

  end

  #method to prompt for contact info; returns a hash
  def prompt_contact_info
    while true
      print "\nPlease enter your first name:".green
      first_name = sanitize_name(gets.chomp)
      if first_name[:is_acceptable]
        break
      else
        puts first_name[:error].red
      end
    end

    while true
      print "\nPlease enter your last name:".green
      last_name = sanitize_name(gets.chomp)
      break if last_name[:is_acceptable]
      puts last_name[:error].red unless last_name[:is_acceptable]
    end

    while true
      print "\nPlease enter your email:".green
      email = sanitize_email(gets.chomp)
      break if email[:is_acceptable]
      puts email[:error].red unless email[:is_acceptable]
    end

    while true
      print "\nPlease add a note:".green
      notes = sanitize_notes(gets.chomp)
      break if notes[:is_acceptable]
      puts notes[:error] unless notes[:is_acceptable]
    end

    {first_name: first_name[:name], last_name: last_name[:name], email: email[:email], notes: notes[:notes]}
  end

  # method to sanitize user input for names
  def sanitize_name(name)
    if name.empty?
      return {is_acceptable: false, error: "You must enter a name."}
    else
      name_array = name.split(//)
      name_array.each do |l|
        return {is_acceptable: false, error: "error no digits allowed in name"} if /\d/ === l
        return {is_acceptable: false, error: "error only letters and periods allowed in name. No spaces or other characters allowed."} if /\W/ === l && l != '.' && l != '-'
      end
      return {is_acceptable: true, name: name.capitalize}
    end
  end

  # method to sanitize user input for names
  def sanitize_email(email)
    if email.empty?
      return {is_acceptable: false, error: "You must enter an email."}
    elsif /\s/.match(email)
      return {is_acceptable: false, error: "Email cannot contain spaces."}
    elsif /@/.match(email)
      return {is_acceptable: true, email: email}
    else
      return {is_acceptable: false, error: "You did not enter a valid email."}
    end
  end

  # sanitizing the notes received from user
  def sanitize_notes(notes)
    if notes.length <= 50 and /\w/.match(notes)
      return {is_acceptable: true, notes: notes}
    else
      return {is_acceptable: false, error: "Note cannot be blank and can be no more than 50 characters."}
    end
  end

  # method to prompt user for contact id
  def prompt_contact_id
    print "\nEnter contact I.D.:".green
    while true
      contact_id = gets.chomp.to_i
      if contact_id == 0
        puts "You didn't enter an integer.".red
        print "Please enter I.D. number as an integer: ".green
      else
        puts "You entered contact I.D. -".dark_grey + " #{contact_id}"
        print "Confirm I.D. entry ('yes' or 'no'): ".yellow
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
  end

  #  method prompting user for the attribute they want to modify or search by.
  def prompt_for_attribute(default = true)
    print "\n"
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

  def serve_menu_response(menu_response)
    if menu_response == 1 #adding a new contact
         contact_info = prompt_contact_info
         response = @crm_rolodex.add_contact(contact_info)
         if response[:status]
          puts response[:contact]
         else
          puts response[:error].red
         end

      elsif menu_response == 2 #modify contact
        while_status = true
        entered_id = prompt_contact_id
        response = @crm_rolodex.display_particular_contact(entered_id)

        if response[:status]
          puts response[:contact]
        else
          puts response[:error].red
          while_status = false
        end

        while while_status
          attribute_type = prompt_for_attribute(false)
          attribute_val = collect_attribute_value
          response = @crm_rolodex.modify_contact(entered_id, attribute_type, attribute_val)

          if response[:status]
            puts response[:contact].format_contact_info_yellow(attribute_type)
            print "\nDo you want to modify another attribute? ('yes' or 'no'):".yellow
            reply = gets.chomp
            break if reply == 'no'
          else
            puts response[:error].red
            break
          end
        end

      elsif menu_response == 3 #display all contacts
        all_contacts = @crm_rolodex.display_all_contacts
        if all_contacts.is_a?(String)
          puts all_contacts.red
        else
          puts add_formatting(all_contacts, 36) # colour is cyan
        end

      elsif menu_response == 4 #display a contact based on id
        entered_id = prompt_contact_id
        response = @crm_rolodex.display_particular_contact(entered_id)
        if response[:status]
          puts response[:contact].format_contact_info_magenta
        else
          puts response[:error].red
        end

      elsif menu_response == 5 #display a contact based on attribute
        attribute_type = prompt_for_attribute
        attribute_val = collect_attribute_value
        response = @crm_rolodex.display_info_by_attribute(attribute_type, attribute_val)

        if response[:status]
          puts add_formatting(response[:contact], 36) # colour is cyan
        else
          puts response[:error].red
        end

      elsif menu_response == 6 #delete a contact
        entered_id = prompt_contact_id
        deletion = @crm_rolodex.delete_contact(entered_id)
        if deletion[:status]
          puts deletion[:contact].format_contact_info_red
        else
          puts deletion[:error].red
        end

      elsif menu_response == 7 # exit CRM and
        clear_screen
        return false
      end

      return true
  end

  def run
    while true
      break unless serve_menu_response(menu)
    end
  end

  private
    def clear_screen
        print "\ec"   # clear the console screen
    end

end


