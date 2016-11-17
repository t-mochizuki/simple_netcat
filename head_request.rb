class HeadRequest
  attr_reader :response

  def initialize( addr='localhost', port=8000 )
    @addr = addr
    @port = port
  end

  def header
    [
      'HEAD / HTTP/1.1',
      "Host: #{@addr}:#{@port}"
    ]
  end

  def dry_run
    %Q( echo "#{header.join('\n')}" | nc -c #{@addr} #{@port} )
  end

  def run
    @response = %x( #{dry_run} )
  end
end
