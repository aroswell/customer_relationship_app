require "spec_helper"

describe Contact do

  describe '#new' do
    it "returns a Contact object" do
      contact = Contact.new
      expect(contact).to be_an_instance_of Contact
    end
  end

end
