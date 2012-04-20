class Wwwizer
  def self.call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    response.redirect("http://www.#{request.host}#{request.path}", 301)
    response.body = ["Redirected"]
    response.finish
  end
end