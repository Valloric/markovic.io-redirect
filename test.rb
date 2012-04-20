require "test/unit"
require "rack/test"

class WwwizerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file("config.ru").first
  end

  def test_redirect_to_www
    get "/redirected", {}, "HTTP_HOST" => "example.org"
    assert_equal "http://www.example.org/redirected", last_response["Location"]
    assert last_response.redirect?
    assert_equal 301, last_response.status
  end
end