class CLI < Thor

  #######################################################
  #     Top-level commands 
  #######################################################  
  desc 'config', 'Configure your DataSift API credentials'
  def config
  	input = Dscli::Parameters.new.user_config(options)
  	puts input.to_yaml
  	open(ENV['HOME'] + '/.datasiftcli', 'w') do |f|
      f.write input.to_yaml
    end
  end

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

  desc 'balance', 'Gets your current plan and balance'
  def balance
    api = Dscli::API.new
    puts api.balance
  end

  #######################################################
  #     Second-level commands 
  #######################################################  
  register(Push, 'push', 'push <command>', 'Run commands relating to push subscriptions')
  register(Historics, 'historics', 'historics <command>', 'Run commands relating to historics')
  register(Source, 'source', 'source <command>', 'Run commands relating to managed sources')

end