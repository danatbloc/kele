module Roadmap

  def get_roadmap(chain_id)
    response = self.class.get("#{@bloc_api}/roadmaps/#{chain_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

  def get_checkpoints(checkpoint_id)
    response = self.class.get("#{@bloc_api}/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

end
