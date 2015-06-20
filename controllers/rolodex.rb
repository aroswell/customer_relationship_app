# Rolodex class
require_relative '../models/contact'

class Rolodex

  # def initialize
  # end

  def add_contact(contact_info)
    new_contact = Contact.new(contact_info)
    if new_contact.save
      puts "New contact was succesfully saved."
    else
      puts "Error: New contact could not be saved."
    end
  end

  def modify_contact(id, type, attribute_val)
    contact = Contact.find(id)

    if contact
      contact.first_name = attribute_val if type == 1
      contact.last_name = attribute_val if type == 2
      contact.email = attribute_val if type == 3
      contact.notes = attribute_val if type == 4
    else
      puts "Contact not found. Please check i.d."
    end

    contact.save

    # allows user to see changes take effect immediately
    display_particular_contact(id)

  end

  def display_all_contacts
    @all_contacts = Contact.all
    puts "Rolodex is empty" if @all_contacts.empty?

    @all_contacts.each do |person|
      puts person.display
    end
  end

  def display_particular_contact(id)
    person = Contact.find(id)
    puts person.display
  end

  def display_info_by_attribute(type, attribute_val)
    if type == 1
      person = Contact.find_by(first_name: attribute_val)
      puts person.display

    elsif type == 2
      person = Contact.find_by(last_name: attribute_val)
      puts person.display

    elsif type == 3
      person = Contact.find_by(email: attribute_val)
      puts person.display

    elsif type == 4
      person = Contact.find_by(notes: attribute_val)
      puts person.display

    end
  end

  # delete contact based on contact id
  def delete_contact(id)
    contact = Contact.find(id)
    contact.destroy
  end

end


#Below is a test area to be remove when program is complete:

# test_rolodex = Rolodex.new
# test_rolodex.add_contact(0)


