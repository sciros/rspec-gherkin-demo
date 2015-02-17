class Login
  include PageObject

  page_url('http://localhost:8080/movietix/login')

  text_field(:username, :id => 'username')
  text_field(:password, :id => 'password')
  button(:log_in, :name => 'commit')

  def log_in_with(username,password)
    self.username = username
    self.password = password
    self.log_in
  end
end