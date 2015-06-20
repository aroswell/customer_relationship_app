require "spec_helper"

describe Contact do

  # This example was to get our feet wet. No need to test ActiveRecord methods
  # such as #new, #build, #create, etc.
  describe '#new' do
    it "returns a Contact object" do
      contact = Contact.new
      expect(contact).to be_an_instance_of Contact
    end
  end

  describe '#display' do
    it "displays the contact's details" do
      person = Contact.create(
        first_name: 'Tim',
        last_name: 'Roberts',
        email: 'tim.roberts@devbbq.com',
        notes: 'Co-founder & CEO'
        )
      id = person.id
      output = "\nFirst name: Tim\nLast name: Roberts\nEmail: tim.roberts@devbbq.com\nNotes: Co-founder & CEO\nI.D.: #{id}"
      expect(output).to eq(person.display)
    end
  end

end
