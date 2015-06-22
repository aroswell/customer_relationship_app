# require 'spec_helper'

describe Rolodex do
  before(:each) do
    @rolodex = Rolodex.new
    Contact.create(
      first_name: 'Tim',
      last_name: 'Roberts',
      email: 'tim.roberts@devbbq.com',
      notes: 'Co-founder & CEO'
        )
    Contact.create(
      first_name: 'James',
      last_name: 'Stewart',
      email: 'stewart@devbbq.com',
      notes: 'Web Developer'
      )
    @all_contacts_string = [
      "\nFirst name: Tim\nLast name: Roberts\nEmail: tim.roberts@devbbq.com\nNotes: Co-founder & CEO\nI.D.: #{Contact.first.id}",
      "\nFirst name: James\nLast name: Stewart\nEmail: stewart@devbbq.com\nNotes: Web Developer\nI.D.: #{Contact.last.id}",
    ]
    @total_number_of_contacts = Contact.all.count
  end

  after(:each) do
    Contact.delete_all
  end

  let(:first_name) {"Ken"}
  let(:last_name) {"Burns"}
  let(:email) {"kburns@jazzdocs.com"}
  let(:notes) {"Writer & Director"}
  let(:existing_person){Contact.first}
  # let(:all_contacts_string) {[
  #     "\nFirst name: Tim\nLast name: Roberts\nEmail: tim.roberts@devbbq.com\nNotes: Co-founder & CEO\nI.D.: #{id}",
  #     "\nFirst name: James\nLast name: Stewart\nEmail: stewart@devbbq.com\nNotes: Web Developer\nI.D.: #{id}",
  #   ]}

  describe '#add_contact' do
    it "adds a new contact to the database" do
      new_contact_info = { first_name: first_name, last_name: last_name, email: email, notes: notes }
      @rolodex.add_contact(new_contact_info)
      expect(Contact.all.count).to eq(@total_number_of_contacts + 1)
    end
  end

  describe '#modify_contact' do
    it "modify contact's first name" do
      allow(@rolodex).to receive(:display_particular_contact) {[]}

      @rolodex.modify_contact(existing_person.id, 1, first_name)
      modified_contact = Contact.find(existing_person.id)
      expect(modified_contact.first_name).to eq(first_name)
    end

    it "modify contact's last name" do
      allow(@rolodex).to receive(:display_particular_contact) {[]}

      @rolodex.modify_contact(existing_person.id, 2, last_name)
      modified_contact = Contact.find(existing_person.id)
      expect(modified_contact.last_name).to eq(last_name)
    end

    it "modify contact's email" do
      allow(@rolodex).to receive(:display_particular_contact) {[]}

      @rolodex.modify_contact(existing_person.id, 3, email)
      modified_contact = Contact.find(existing_person.id)
      expect(modified_contact.email).to eq(email)
    end

    it "modify contact's notes" do
      allow(@rolodex).to receive(:display_particular_contact) {[]}

      @rolodex.modify_contact(existing_person.id, 4, notes)
      modified_contact = Contact.find(existing_person.id)
      expect(modified_contact.notes).to eq(notes)
    end
  end

  describe '#display_all_contacts' do
    it "display all contacts method should return an array of strings of all contacts in database" do
      expect(@rolodex.display_all_contacts).to eq(@all_contacts_string)
    end
  end

  describe '#display_particular_contact' do
    it "method finds contact by id and returns string of single contact" do
      id = Contact.first.id
      expect(@rolodex.display_particular_contact(id)).to eq(@all_contacts_string[0])
    end
  end

  describe '#display_info_by_attribute' do
    it "method finds contact by first name and returns contact as string" do
      actual = @rolodex.display_info_by_attribute(1, "James")
      expect(actual).to eq(@all_contacts_string[1])
    end

    it "method finds contact by last name and returns contact as string" do
      actual = @rolodex.display_info_by_attribute(2, "Stewart")
      expect(actual).to eq(@all_contacts_string[1])
    end

    it "method finds contact by email and returns contact as string" do
      actual = @rolodex.display_info_by_attribute(3, "tim.roberts@devbbq.com")
      expect(actual).to eq(@all_contacts_string[0])
    end

    it "method finds contact by notes and returns contact as string" do
      actual = @rolodex.display_info_by_attribute(4, "Co-founder & CEO")
      expect(actual).to eq(@all_contacts_string[0])
    end
  end

  describe '#delete_contact' do
    it "delete a contact found by id number" do
      id = existing_person.id
      @rolodex.delete_contact(id)
      expect(Contact.all.count).to eq(@total_number_of_contacts - 1)
    end
  end

end