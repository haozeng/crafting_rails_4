class LiveAssetsController < ActionController::Base
  include ActionController::Live

  def sse
    response.headers["Cache-Control"] = 'no-cache'
    response.headers["Content-Type"] = 'text/event-stream'

    sse = LiveAssets::SSESubscriber.new
    sse.each { |msg| puts msg; response.stream.write msg }

  rescue IOError
    sse.close
    response.stream.close
  end

  def hello
    while true
      # puts response
      # puts response.class
      # puts response.class.superclass
      # puts response.stream
      # puts response.stream.class
      # puts response.stream.class.superclass
      response.stream.write "hello world\n"
      sleep 1
    end
  rescue IOError
    response.stream.close
  end
end
