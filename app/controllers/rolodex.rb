# Rolodex class
require_relative '../models/contact'

class Rolodex

  def add_contact(contact_info)
    new_contact = Contact.new(contact_info)
    if new_contact.save
      {status: true, contact: "\nNew contact was succesfully saved."}
    else
      {status: false, error: "\nError: New contact could not be saved."}
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
        return display_particular_contact(id)
      else
        return {status: false, error: "\nError: could not save to database"}
      end

    else
      return {status: false, error: "\nContact not found. Please check I.D."}
    end

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

  # method ot display a particular contact base on the contact's I.D.
  def display_particular_contact(id)
    if person = Contact.find_by(id: id)
      {status: true, contact: person.display}
    else
      {status: false, error: "\nContact not found."}
    end
  end

  # method to display contacts by their attribute
  def display_info_by_attribute(type, attribute_val)
    if type == 1
      result = Contact.where(first_name: attribute_val)
      if result.empty?
        {status: false, error: "\nContact with first name #{attribute_val} not found."}
      else
        # see private method section for load_people
        {status: true, contact: load_people(result)}
      end

    elsif type == 2
      result = Contact.where(last_name: attribute_val)
      if result.empty?
        {status: false, error: "\nContact with last name #{attribute_val} not found."}
      else
        {status: true, contact: load_people(result)}
      end

    elsif type == 3
      result = Contact.where(email: attribute_val)
      if result.empty?
        {status: false, error: "\nContact with email #{attribute_val} not found."}
      else
        {status: true, contact: load_people(result)}
      end

    elsif type == 4
      result = Contact.where(notes: attribute_val)
      if result.empty?
        {status: false, error: "\nContact with notes: #{attribute_val} not found."}
      else
        {status: true, contact: load_people(result)}
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

  private
    def load_people(result)
      people = []
      result.each do |person|
      people << person.display
      end
      return people
    end

end
