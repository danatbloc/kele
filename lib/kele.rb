require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = "https://www.bloc.io/api/v1"
    @sessions_url = "#{@bloc_api}/sessions"
    @response = self.class.post(@sessions_url, :query => {email: @email, password: @password})
    @auth_token = @response["auth_token"]
  end

end
