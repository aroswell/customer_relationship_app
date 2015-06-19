require_relative "spec_helper"

describe Contact do

  describe '#new' do
    @contact = Contact.new
    it "returns a Contact object" do
      expect(@contact).to be Contact
    end
  end

end
