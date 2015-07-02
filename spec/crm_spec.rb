
describe CRM do
  before (:all) do
    @crm = CRM.new
  end

  let(:long_note) {"These notes or note is longer than 50 characters; therefore the #limit_notes method will return false boolean value"}
  let(:lowercase_name) {"terry"}
  let(:jumbled_name) {"tErRY"}


  describe '#serve_menu_response' do

    context "entering something other than a number between (and including) 1 and 7" do
      it "returns true when it's passed 0" do
        expect(@crm.serve_menu_response(0)).to eq(true)
      end

      it "returns true when it's passed an empty string" do
        expect(@crm.serve_menu_response("")).to eq(true)
      end

      it "returns true when it's passed 8" do
        expect(@crm.serve_menu_response(8)).to eq(true)
      end
    end

    context "entering number 7 to exit app" do
      it "returns false when passed 7" do
        allow(@crm).to receive(:clear_screen) {[]}
        expect(@crm.serve_menu_response(7)).to eq(false)
      end
    end

  end

  describe '#sanitize_name' do
    context "when nothing is really entered in the name field" do
      it "returns false when a name is not entered" do
        name = @crm.sanitize_name("")
        expect(name[:is_acceptable]).to eq(false)
      end

      it "returns false when white space is enter for a name" do
        name = @crm.sanitize_name("  ")
        expect(name[:is_acceptable]).to eq(false)
      end
    end

    context "when characters other than letters, dashes, or periods are entered in the name field" do
      it "returns false if only the characters entered are numbers" do
        name = @crm.sanitize_name("3234")
        expect(name[:is_acceptable]).to eq(false)
      end

      it "returns false if any of the characters entered are numbers" do
        name = @crm.sanitize_name("J0hn")
        expect(name[:is_acceptable]).to eq(false)
      end

      it "returns false if any of the characters are not letters, dashes, or periods" do
        name = @crm.sanitize_name("Ed*")
        expect(name[:is_acceptable]).to eq(false)
      end

      it "returns true for hyphenated name" do
        name = @crm.sanitize_name("Kerry-ann")
        expect(name[:is_acceptable]).to eq(true)
      end

      it "all hyphens for a name returns false" do
        name = @crm.sanitize_name("---")
        expect(name[:is_acceptable]).to eq(false)
      end

      it "all periods for a name returns false" do
        name = @crm.sanitize_name("....")
        expect(name[:is_acceptable]).to eq(false)
      end
    end

    context "name capitalization" do
      it "capitalizes lower case names" do
        name = @crm.sanitize_name(lowercase_name)
        expect(name[:user_entry]).to eq("Terry")
      end

      it "capitalizes names that may have out of place capitals" do
        name = @crm.sanitize_name(jumbled_name)
        expect(name[:user_entry]).to eq("Terry")
      end
    end

  end

  describe '#sanitize_notes' do
    it "returns false when the notes field is more than 50 characters long" do
      notes = @crm.sanitize_notes(long_note)
      expect(notes[:is_acceptable]).to eq(false)
    end

    it "returns false when the notes field is blank" do
      notes = @crm.sanitize_notes("")
      expect(notes[:is_acceptable]).to eq(false)
    end

    it "returns false when the notes field is only white space" do
      notes = @crm.sanitize_notes("  ")
      expect(notes[:is_acceptable]).to eq(false)
    end
  end

  describe '#sanitize_email' do
    it "returns false if email does not contain '@'" do
      email = @crm.sanitize_email("rockyatgmail.com")
      expect(email[:is_acceptable]).to eq(false)
    end

    it "returns false when no email is entered" do
      email = @crm.sanitize_email("")
      expect(email[:is_acceptable]).to eq(false)
    end

    it "returns false when white space is enter as an email" do
      email = @crm.sanitize_email(" @ space.com")
      expect(email[:is_acceptable]).to eq(false)
    end

  end

end