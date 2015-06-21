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

    if contact.save
      # allows user to see changes take effect immediately
      display_particular_contact(id)
    else
      puts "Error: could not save to database"
    end

  end

  def display_all_contacts
    @all_contacts = Contact.all
    puts "Rolodex is empty" if @all_contacts.empty?

    @all_contacts.each do |person|
      puts person.display
    end
  end

  def display_particular_contact(id)
    if person = Contact.find(id)
      puts person.display
    else
      puts "Contact not found."
    end
  end

  def display_info_by_attribute(type, attribute_val)
    if type == 1
      if person = Contact.find_by(first_name: attribute_val)
        puts person.display
      else
        puts "Contact with first name #{attribute_val} not found."
      end

    elsif type == 2
      if person = Contact.find_by(last_name: attribute_val)
        puts person.display
      else
        puts "Contact with last name #{attribute_val} not found."
      end

    elsif type == 3
      if person = Contact.find_by(email: attribute_val)
        puts person.display
      else
        puts "Contact with email #{attribute_val} not found."
      end

    elsif type == 4
      if person = Contact.find_by(notes: attribute_val)
        puts person.display
      else
        puts "Contact with notes: #{attribute_val} not found."
      end

    end
  end

  # delete contact based on contact id
  def delete_contact(id)
    if contact = Contact.find(id)
      contact.destroy
    else
      puts "Contact with that id not found."
    end
  end

end
