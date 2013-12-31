require 'yajl'

module Dscli
  class Storage

    def initialize
      if !File.exist?(File.expand_path('~') + '/.datasiftcli')
        @configfile = File.new(File.expand_path('~') + '/.datasiftcli', 'w')
        @configfile.close
      else
        @configfile = File.expand_path('~') + '/.datasiftcli'
      end
    end

    def set_auth(auth)
      config = File.read(@configfile)
      if config == ""
        File.open(@configfile, "w") { |f|
          f.write(Yajl::Encoder.encode(auth) + "\n")
        }
      end
    end

    def get_auth
      config = YAML.load(File.read(@configfile))
    end

  end
end