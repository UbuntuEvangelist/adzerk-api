require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'net/http'

describe "Channel API security" do

  it "should reject unauthenticated GET requests" do
    uri = URI.parse(ENV['ADZERK_API_HOST'] + 'channel/')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    http.request(request).response.code.should_not == 200
  end

  it "should reject GET requests with null API keys" do
    uri = URI.parse(ENV['ADZERK_API_HOST'] + 'channel/')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field "X-Adzerk-ApiKey", ""
    http.request(request).response.code.should_not == 200
  end

end