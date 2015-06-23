# Rolodex class
require_relative '../models/contact'

class Rolodex

  # def initialize
  # end

  def add_contact(contact_info)
    new_contact = Contact.new(contact_info)
    if new_contact.save
      puts "\nNew contact was succesfully saved."
    else
      puts "\nError: New contact could not be saved."
    end
  end

  def modify_contact(id, type, attribute_val)

    if contact = Contact.find_by(id: id)
      contact.first_name = attribute_val if type == 1
      contact.last_name = attribute_val if type == 2
      contact.email = attribute_val if type == 3
      contact.notes = attribute_val if type == 4

      if contact.save
      # allows user to see changes take effect immediately
      puts display_particular_contact(id)
      else
        puts "\nError: could not save to database"
      end

    else
      puts "\nContact not found. Please check I.D."
      return false
    end

    return true
  end

  def display_all_contacts
    all_contacts = Contact.all
    if all_contacts.empty?
      "\nRolodex is empty"
    else
      contact_string = []
      all_contacts.each do |person|
        contact_string << person.display
      end
      contact_string
    end
  end

  def display_particular_contact(id)
    if person = Contact.find_by(id: id)
      person.display
    else
      "\nContact not found."
    end
  end

  def display_info_by_attribute(type, attribute_val)
    if type == 1
      if person = Contact.find_by(first_name: attribute_val)
        person.display
      else
        "\nContact with first name #{attribute_val} not found."
      end

    elsif type == 2
      if person = Contact.find_by(last_name: attribute_val)
        person.display
      else
        "\nContact with last name #{attribute_val} not found."
      end

    elsif type == 3
      if person = Contact.find_by(email: attribute_val)
        person.display
      else
        "\nContact with email #{attribute_val} not found."
      end

    elsif type == 4
      if person = Contact.find_by(notes: attribute_val)
        person.display
      else
        "\nContact with notes: #{attribute_val} not found."
      end

    end
  end

  # delete contact based on contact id
  def delete_contact(id)
    if contact = Contact.find_by(id: id)
      contact.destroy
      {status: true, contact: contact.display}
    else
      {status: false, error: "\nContact with that I.D. not found."}
    end
  end

end
