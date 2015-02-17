require 'rspec-gherkin'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before do
    browser = Watir::Browser.new :chrome

    @browser = browser
    @browser.window.resize_to 1100,850
    @browser.window.move_to 0,0
  end

  config.after do
    @browser.close
  end

  config.after(:each) do |example|
    if example.exception
      Dir::mkdir('screenshots') if not File.directory?('screenshots')
      meta = example.metadata
      screenshot_name = "./screenshots/FAILED_#{meta[:scenario_name].gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot_name)

      puts meta[:full_description] + "\n  Screenshot: #{screenshot_name}"
    end
  end
end