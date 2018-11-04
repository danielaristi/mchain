#!/bin/ruby
require 'net/http'
require 'uri'
require 'json'
load 'class.rb'


def execRest (server,method)

uri = URI.parse("http://#{server.getIp}:#{server.getPort}")
request = Net::HTTP::Post.new(uri)
request.basic_auth("#{server.getUser}", "#{server.getPass}")
request.content_type = "text/plain;"

request.body = method
req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

#p response.body 
#p response.code

return response.body,response.code
end



def execRestAdm (admchain,method)

uri = URI.parse("http://#{admchain.getServerip}:#{admchain.getRpcport}")
request = Net::HTTP::Post.new(uri)
request.basic_auth("#{admchain.getUser}", "#{admchain.getPass}")
request.content_type = "text/plain;"

request.body = method
req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

#p response.body
#p response.code

return response.body,response.code
end

