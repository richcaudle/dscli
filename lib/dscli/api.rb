require 'datasift'
require 'yajl'

module Dscli
  class API
    attr_reader :hash

    def initialize
      storage = Dscli::Storage.new
      config = storage.get_auth
      @config = {:username => config[:auth][:username], :api_key => config[:auth][:api_key], :enable_ssl => false}
      @datasift = DataSift::Client.new(@config)
    end

    #
    # Core API endpoints
    # [ Missing /validate /balance ]

    def compile(csdl)
      response = @datasift.compile csdl
      definition = response[:data]
      definition[:hash]
    end

    def usage(period)
      response = @datasift.usage period
      usage = response[:data]
    end

    def dpu(hash)
      response = @datasift.dpu hash
      dpu = response[:data]
    end

    def stream(hash)
      on_delete  = lambda { |stream, m| puts m }
      on_error   = lambda { |stream, e| puts 'A serious error has occurred: ' + e.message.to_s }
      on_message = lambda { |message, stream, hash| puts Yajl::Encoder.encode(message) }
      on_connect = lambda { |stream| stream.subscribe(hash, on_message) }
      on_close   = lambda { |stream| puts 'closed' }

      on_datasift_message = lambda do |stream, message, hash|
        puts "DataSift Message #{hash} ==> #{message}"
      end

      conn = DataSift::new_stream(@config, on_delete, on_error, on_connect, on_close)
      conn.on_datasift_message = on_datasift_message
      conn.stream.read_thread.join

      rescue DataSiftError => dse
        puts "Error #{dse.message}"
        case dse
          when ConnectionError
          when AuthError
          when BadRequestError
            puts "Error #{dse.message}"
        end
    end

  end

end
