require 'rest_client'
require 'multi_json'

require 'wanikani/user'
require 'wanikani/study_queue'
require 'wanikani/level'
require 'wanikani/srs'

module Wanikani
  API_ENDPOINT = "http://www.wanikani.com/api/user"

  def self.api_key=(api_key)
    @@api_key = api_key
  end

  def self.api_key
    @@api_key
  end

  def self.api_response(resource, optional_arg = nil)
    raise ArgumentError, "You must define a resource to query Wanikani" if resource.nil? || resource.empty?

    response = RestClient.get("#{Wanikani::API_ENDPOINT}/#{Wanikani.api_key}/#{resource}/#{optional_arg}")
    return MultiJson.load(response)
  end
end