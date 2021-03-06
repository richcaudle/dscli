class Historics < Thor
  
  desc 'list [page]', 'Lists all historic queries'
  def list(page = 1)
    api = Dscli::API.new
    results = api.historics_list(page)

    puts "\nTotal Historic Queries: #{results.count}\n\n"
    puts 'ID                   | Name                 | Created                    | Definition Hash                   | Status   '
    puts '---------------------------------------------------------------------------------------------------------------------------'

    results[:data].each { |s| puts "#{s[:id]} | #{ '%-20.20s' % s[:name] } |  #{Time.at(s[:created_at])} | #{ s[:definition_id] } | #{s[:status]}" }
    puts "\n"

  end

  desc 'get (id)', 'Gets details of a historic query'
  def get(id)
    
    begin
      api = Dscli::API.new
      response = api.historics_get(id)
      puts response[:data].to_yaml
    rescue ApiResourceNotFoundError => e
      puts "Specified historic query '#{id}' was not found. It may have already been deleted."
    end

  end

  desc 'stop (id)', 'Stops a historic query'
  def stop(id)
    api = Dscli::API.new
      
    begin
      response = api.historics_stop(id)

      if response[:http][:status] == 204
        puts "Historic query '#{id}' stopped successfully"
      else
        # TODO: How do we handle a different code?
        response
      end
    rescue ApiResourceNotFoundError => e
      puts "Specified historic query '#{id}' not found. It may have been deleted."
    end

  end

  desc 'delete (id)', 'Deletes a historic query'
  def delete(id)
    api = Dscli::API.new

    begin

      response = api.historics_delete(id)

      if response[:http][:status] == 204
        puts "Historic query '#{id}' deleted successfully"
      else
        response
      end
    rescue ApiResourceNotFoundError => e
      puts "Specified historic query '#{id}' not found. It may have already been deleted."
    end

  end

end