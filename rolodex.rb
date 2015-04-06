# Rolodex class

class Rolodex
  # attr_accessor :contact_id

  def intialize
    @contacts = []
    @contact_id = 1000
  end

  def add(new_cont)
    # @contact_id += 1 #first contact ID is not 1000, but 1001
    # new_cont.id = @contact_id
    @contacts << new_cont
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