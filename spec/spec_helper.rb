require 'rspec-gherkin'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

browser = Watir::Browser.new :firefox

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before do
    @browser = browser
    @browser.window.resize_to 1100,850
    @browser.window.move_to 0,0
  end

  config.after do
    @browser.close
  end
end