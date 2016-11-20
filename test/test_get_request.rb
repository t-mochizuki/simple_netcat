require 'test/unit'
require './lib/simple_netcat/get_request.rb'

class TestGetRequest < Test::Unit::TestCase
  def setup
    @request = SimpleNetcat::GetRequest.new
  end

  def test_dry_run
    dry_run = ' echo "GET / HTTP/1.1\nHost: localhost:4567\nConnection: close" | nc -c localhost 4567 '
    assert_equal @request.dry_run, dry_run
  end

  def test_run
    assert_match %r(HTTP/1\.1 200 OK), @request.run
  end
end
