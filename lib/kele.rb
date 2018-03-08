require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = "https://www.bloc.io/api/v1"
    @sessions_url = "https://www.bloc.io/api/v1/sessions"
  end

  def post
    self.class.post(@sessions_url, :query => {email: @email, password: @password})
  end


end
