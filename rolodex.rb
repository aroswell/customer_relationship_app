# Rolodex class

class Rolodex
  # attr_accessor :contact_id

  def initialize
    @contacts = []
    @contact_id = 1000
  end

  def add_contact(new_cont)
    @contact_id += 1 #first contact ID is not 1000, but 1001
    new_cont.id = @contact_id
    @contacts << new_cont
  end

  def modify_contact(id, type, attribute_val)
    @contacts.each do |people|
        people.first_name = attribute_val if people.id == id && type == 1
        people.last_name = attribute_val if people.id == id && type == 2
        people.email = attribute_val if people.id == id && type == 3
        people.notes = attribute_val if people.id == id && type == 4
    end
  end

  def display_all_contacts
    puts "Rolodex is empty" if @contacts.empty?

    @contacts.each do |item|
        puts item.display
    end
  end

  def display_particular_contact(id)
    @contacts.each do |people|
      puts people.display if people.id == id
    end
  end

  def display_info_by_attribute(type, attribute_val)
    if type == 1
      @contacts.each do |people|
        puts people.display if people.first_name == attribute_val
      end
    elsif type == 2
      @contacts.each do |people|
        puts people.display if people.last_name == attribute_val
      end
    elsif type == 3
      @contacts.each do |people|
        puts people.display if people.email == attribute_val
      end
    elsif type == 4
      @contacts.each do |people|
        puts people.display if people.notes == attribute_val
      end
    end
  end

  # delete contact based on contact id
  def delete_contact(id)
    @contacts.each do |people|
      @contacts.delete(people) if people.id == id
    end
  end

end


#Below is a test area to be remove when program is complete:

# test_rolodex = Rolodex.new
# test_rolodex.add_contact(0)


