require 'httparty'
require 'json'
require_relative 'roadmap'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    @email = email
    @password = password
    @bloc_api = "https://www.bloc.io/api/v1"
    @sessions_url = "#{@bloc_api}/sessions"
    @response = self.class.post(@sessions_url, body: {email: @email, password: @password})
    @auth_token = @response["auth_token"]
  end

  def get_me
    response = self.class.get("#{@bloc_api}/users/me", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("#{@bloc_api}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    response.to_a
  end

  def get_messages(page_number=1)
    response = self.class.get("#{@bloc_api}/message_threads", headers: { "authorization" => @auth_token }, body: { "page": page_number})
    JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, message)
    self.class.post("#{@bloc_api}/messages",
    headers: { "authorization" => @auth_token },
    body: {
      "sender": sender,
      "recipient_id": recipient_id,
      "subject": subject,
      "stripped-text": message.strip
    })
  end

end
