require "test/unit"
require "rack/test"

class WwwizerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file("config.ru").first
  end

  def test_redirect_to_www
    get "/redirected", {:a_parameter => "1", :b_parameter => 2}, "HTTP_HOST" => "example.org"
    assert_equal "http://www.example.org/redirected?a_parameter=1&b_parameter=2", last_response["Location"]
    assert_equal 301, last_response.status
    assert_equal "text/html", last_response.content_type
    assert_equal %Q{Click <a href="http://www.example.org/redirected?a_parameter=1&amp;b_parameter=2">here</a> if you are not redirected.}, last_response.body
  end
  
  def test_redirect_without_parameters
    get "/asdf", {}, "HTTP_HOST" => "example2.org"
    assert_equal "http://www.example2.org/asdf", last_response["Location"]
    assert_equal %Q{Click <a href="http://www.example2.org/asdf">here</a> if you are not redirected.}, last_response.body
  end
  
  def test_redirect_root
    get "/", {}, "HTTP_HOST" => "example3.org"
    assert_equal "http://www.example3.org/", last_response["Location"]
    assert_equal %Q{Click <a href="http://www.example3.org/">here</a> if you are not redirected.}, last_response.body
  end
end