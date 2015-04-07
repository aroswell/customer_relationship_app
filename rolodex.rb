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
    puts new_cont.display
    @contacts << new_cont
    # puts @contact_id
  end

  def modify_contact
  end

  def display_all_contacts
  end

  def display_particular_contact
  end

  def display_info_by_attribute
  end

  def delete_contact
  end

end


#Below is a test area to be remove when program is complete:

# test_rolodex = Rolodex.new
# test_rolodex.add(0)


