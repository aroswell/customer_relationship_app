require 'spec_helper'

describe Rolodex do
  before(:each) do
    @rolodex = Rolodex.new
    @existing_person = Contact.create(
        first_name: 'Tim',
        last_name: 'Roberts',
        email: 'tim.roberts@devbbq.com',
        notes: 'Co-founder & CEO'
        )
    @total_number_of_contacts = Contact.all.count
  end

  let(:first_name) {"Ken"}
  let(:last_name) {"Burns"}
  let(:email) {"kburns@jazzdocs.com"}
  let(:notes) {"Writer & Director"}

  describe '#add_contact' do
    it "adds a new contact to the database" do
      new_contact_info = { first_name: first_name, last_name: last_name, email: email, notes: notes }
      @rolodex.add_contact(new_contact_info)
      expect(Contact.all.count).to eq(@total_number_of_contacts + 1)
    end
  end

  describe '#modify_contact' do
    it "modify contact's first name" do
      allow(@rolodex).to receive(:display_particular_contact) {""}

      @rolodex.modify_contact(@existing_person.id, 1, first_name)
      modified_contact = Contact.find(@existing_person.id)
      expect(modified_contact.first_name).to eq(first_name)
    end

    it "modify contact's last name" do
      allow(@rolodex).to receive(:display_particular_contact) {""}

      @rolodex.modify_contact(@existing_person.id, 2, last_name)
      modified_contact = Contact.find(@existing_person.id)
      expect(modified_contact.last_name).to eq(last_name)
    end

    it "modify contact's email" do
      allow(@rolodex).to receive(:display_particular_contact) {""}

      @rolodex.modify_contact(@existing_person.id, 3, email)
      modified_contact = Contact.find(@existing_person.id)
      expect(modified_contact.email).to eq(email)
    end

    it "modify contact's notes" do
      allow(@rolodex).to receive(:display_particular_contact) {""}

      @rolodex.modify_contact(@existing_person.id, 4, notes)
      modified_contact = Contact.find(@existing_person.id)
      expect(modified_contact.notes).to eq(notes)
    end
  end

  # No need to test outgoing query
  # describe '#display_all_contacts' do
  # end

  describe '#display_particular_contact' do
  end

  describe '#display_info_by_attribute' do
  end

  describe '#delete_contact' do
    it "delete a contact found by id number" do
      id = @existing_person.id
      @rolodex.delete_contact(id)
      expect(Contact.all.count).to eq(@total_number_of_contacts - 1)
    end
  end

end