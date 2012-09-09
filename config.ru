require 'erb'

run proc { |env|
  request = Rack::Request.new(env)
  response = Rack::Response.new

  url = "http://val.markovic.io#{request.path}#{("?" + request.query_string) if !request.query_string.empty?}"
  response.redirect(url, 301)
  response.body = [%Q{Click <a href="#{ERB::Util.h url}">here</a> if you are not redirected.}]
  response.finish
}
