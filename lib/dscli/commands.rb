require 'thor'
require 'yaml'

module Dscli
  class Commands < Thor
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    desc 'config', 'Configure your DataSift API credentials'

    def config
      open(ENV['HOME'] + '/.datasiftcli', 'w') do |f|
        f.write Dscli::Parameters.new.user_config(options).to_yaml
      end
    end

    #
    # Core API endpoints
    # [ Missing /validate /balance ]
    #

    desc 'compile (csdl)', 'Compile CSDL'
    def compile(csdl)
      api = Dscli::API.new
      definition = api.compile(csdl)
      puts definition
    end

    desc 'usage [period]', 'Find your stream and license fee usage'
    def usage(period = 'day')
      api = Dscli::API.new
      puts Yajl::Encoder.encode(api.usage(period), :pretty => true)
    end

    desc 'dpu (hash)', 'Find the DPU cost of a given stream hash'
    def dpu(hash)
      api = Dscli::API.new
      puts Yajl::Encoder.encode(api.dpu(hash), :pretty => true)
    end

    desc 'stream (hash)', 'Stream interactions from a DataSift stream to the command line'
    def stream(hash)
      api = Dscli::API.new
      api.stream(hash)
    end

  end
end
