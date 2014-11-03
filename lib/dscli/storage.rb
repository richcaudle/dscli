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

    def get_auth
      config = YAML.load(File.read(@configfile))
    end

  end
end