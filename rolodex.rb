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

  def modify_contact(mod_cont)

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

  def display_info_by_attribute(attribute)
    @contacts.each do |people|
      puts people.display if people.attribute == attribute
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


