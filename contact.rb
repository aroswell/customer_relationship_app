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
    "\nFirst name: #{@first_name}\nLast name: #{@last_name}\nEmail: #{@email}\nNotes: #{@notes}\n"
  end

end
