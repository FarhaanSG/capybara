describe "Incorrect user details provide valid user" do

  context "it should redirect to the log in page" do

    before(:all) do
      @bbc_page = BBCSite.new.bbc_homepage
      @bbc_page.visit_homepage
      @bbc_page.click_sign_in_link
    end

    it "should produce an error when inputting an incorrect password for a valid account" do
      # expect(@bbc_page.check_username_field("Yojso@chineese.com")).to eq(true)
    end


  end

  context "it should respond with the correct error when invalid username is input" do

    before(:all) do
      @bbc_page = BBCSite.new.bbc_sign_in_page
      @bbc_page.visit_log_in
    end

    it "should accept a username input" do
      expect(@bbc_page.check_username_field("farhaaan_ahmed-96@hotmail.co.uk")).to eq(true)
    end

    it "should accept a password input" do
      expect(@bbc_page.check_password_field("Farhaan786")).to eq(true)
    end

    it "should click the login button" do
      expect(@bbc_page.click_submit_button_username).to eq(true)
    end

  end

  context "it should respond with the correct error when incorrect password is input" do

    before(:all) do
      @bbc_page = BBCSite.new.bbc_sign_in_page
      @bbc_page.visit_log_in
    end

    it "should accept a username input" do
      expect(@bbc_page.check_username_field("farhaan_ahmed-96@hotmail.co.uk")).to eq(true)
    end

    it "should accept a password input" do
      expect(@bbc_page.check_password_field("Abcd12345")).to eq(true)
    end

    it "should click the login button" do
      expect(@bbc_page.click_submit_button_password).to eq(true)
    end

  end

  context "it should login if correct data is inout" do

    before(:all) do
      @bbc_page = BBCSite.new.bbc_sign_in_page
      @bbc_page.visit_log_in
    end

    it "should accept a username input" do
      expect(@bbc_page.check_username_field("farhaan_ahmed-96@hotmail.co.uk")).to eq(true)
    end

    it "should accept a password input" do
      expect(@bbc_page.check_password_field("Farhaan786")).to eq(true)
    end

    it "should click the login button" do
      expect(@bbc_page.click_submit_button).to eq(true)
    end

  end


end
