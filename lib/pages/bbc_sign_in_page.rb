require "capybara"

class BBCSignInPage

  LOG_IN_PAGE = "https://account.bbc.com/signin"
  USERNAME_FIELD_ID = "#user-identifier-input"
  PASSWORD_FIELD_ID = "#password-input"
  SUBMIT_BUTTON_ID = "#submit-button"
  USERNAME_ERROR_ID = "#form-message-username"
  PASSWORD_ERROR_ID = "#form-message-password"

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    @session = Capybara::Session.new(:chrome)
  end

  def visit_log_in
    @session.visit(LOG_IN_PAGE)
  end

  def get_username_field
    @session.find(USERNAME_FIELD_ID)
  end

  def check_username_field(username)
    get_username_field.fill_in(with: username)
    if get_username_field["value"] == username
      return true
    end
    return false
  end

  def check_if_username_exists
    @session.find(USERNAME_ERROR_ID)
  end

  def get_password_field
    @session.find(PASSWORD_FIELD_ID)
  end

  def check_password_field(password)
    get_password_field.fill_in(with: password)
    if get_password_field["value"] == password
      return true
    end
    return false
  end

  def check_if_password_matches
    @session.find(USERNAME_ERROR_ID)
  end

  def get_submit_button
    @session.find(SUBMIT_BUTTON_ID)
  end

  def click_submit_button_username
    get_submit_button.click
    return check_if_username_exists.visible?
  end

  def click_submit_button_password
    get_submit_button.click
    return check_if_password_matches.visible?
  end

  def click_submit_button
    get_submit_button.click
    return check_if_logged_in.visible?
  end

  def check_if_logged_in
    if @session.find(text: "Your account")
      return true
    end
    return false
  end

end

# loginpage = BBCSignInPage.new
# loginpage.visit_log_in
# loginpage.check_username_field
