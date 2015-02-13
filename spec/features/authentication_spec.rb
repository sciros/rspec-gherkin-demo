require_relative '../../spec/spec_helper'
require_relative 'pages/login'

feature 'basic authentication' do
  scenario 'log in with valid credentials' do
    visit Login do |login_page|
      login_page.log_in_with('user1','P4ssw0rd')
      expect(login_page.text).to include('Welcome')
    end
  end
end
