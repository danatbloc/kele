require 'httparty'
require 'json'

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

  def get_me
    response = self.class.get("#{@bloc_api}/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
