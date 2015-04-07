# Contact class

class Contact
  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize(frst_nm, lst_nm, eml, nts)
    @first_name = frst_nm
    @last_name = lst_nm
    @email = eml
    @notes = nts
    @id = nil
  end

  def display
    "\nFirst name: #{@first_name}\nLast name: #{@last_name}\nEmail: #{@email}\nNotes: #{@notes}\nI.D.: #{@id}"
  end

end


#Below is a test area to be remove when program is complete:

# test_contact = Contact.new("David", "Banner", "banner.d@hulk.com", "Turns green with anger not envy")
# puts test_contact.display

# test_contact.id = 1001

# puts test_contact.display