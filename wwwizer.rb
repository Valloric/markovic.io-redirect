require 'erb'

class Wwwizer
  def self.call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    url = "http://www.#{request.host}#{request.path}#{("?" + request.query_string) if !request.query_string.empty?}"
    response.redirect(url, 301)
    response.body = [%Q{Click <a href="#{ERB::Util.h url}">here</a> if you are not redirected.}]
    response.finish
  end
end