require 'socket'

server = TCPServer.new('0.0.0.0', 80)

loop do
  client = server.accept
  request = client.readpartial(2048)

  method, path, version = request.lines[0].split

  puts "#{method} #{path} #{version}"

  response_body = if path == "/healthcheck"
                    "OK"
                  else
                    "Well, hello there!"
                  end

  response = "HTTP/1.1 200 OK\r\n" +
             "Content-Type: text/plain\r\n" +
             "Content-Length: #{response_body.bytesize}\r\n" +
             "Connection: close\r\n" +
             "\r\n" +
             "#{response_body}"

  client.write(response)
  client.close
end
