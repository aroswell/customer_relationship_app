# Contact class

class Contact
  attr_accessor :first_name, :last_name, :email, :notes

  def initialize(frst_nm, lst_nm, eml, nts)
    @first_name = frst_nm
    @last_name = lst_nm
    @email = eml
    @notes = nts
  end

  def display
    "method displays contact info"
  end

end
