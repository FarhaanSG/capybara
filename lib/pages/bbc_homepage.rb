require "capybara"

class BBCHomepage

  HOMEPAGE_URL = "https://www.bbc.co.uk/"
  SIGN_IN_LINK_ID = "#idcta-link"

  def initialize
    Capybara.register_driver :chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    @session = Capybara::Session.new(:chrome)
  end

  def visit_homepage
    @session.visit(HOMEPAGE_URL)
  end

  def get_sign_in_link
    @session.find(SIGN_IN_LINK_ID)
  end

  def click_sign_in_link
    get_sign_in_link.click
  end

end


# homepage = BBCHomepage.new
# homepage.visit_homepage
# homepage.click_sign_in_link
