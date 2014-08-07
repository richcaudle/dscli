module Dscli
  class Connectors

    CONNECTORS = [["HTTP", "http"],
                  ["CouchDB", "couchdb"],
                  ["DynamoDB", "dynamodb"],
                  ["ElasticSearch", "elasticsearch"],
                  ["FTP", "ftp"],
                  ["Google BigQuery", "bigquery"],
                  ["MongoDB", "mongodb"],
                  ["MySQL", "mysql"],
                  ["Pull", "pull"],
                  ["Redis", "redis"],
                  ["S3", "s3"],
                  ["SFTP", "sftp"],
                  ["Splunk Storm REST", "splunkstormrest"],
                  ["Splunk Enterprise", "splunkenterprise"],
                  ["Zoomdata", "zoomdata"]]

    def list
      conenctors = CONNECTORS.map { |c| c[1] }
    end

    def setOutputParams(connector)
      @op = Dscli::OutputParams.new
      @push = {}
      @push[:auth] = {}
      @push[:server_level_auth] = {}
      self.send(connector)
    end


    #
    # Method to create each Push Destination
    #

    def http
    end

    def couchdb
    end

    def dynamodb
    end

    def elasticsearch
    end

    def ftp
    end

    def bigquery
    end

    def mongodb
    end

    def mysql
    end

    def pull
      @push[:format] = @op.format
      return @push
    end

    def redis
    end

    def s3
      @push[:auth][:access_key] = @op.auth_access_key
      @push[:auth][:secret_key] = @op.auth_secret_key
      @push[:bucket] = @op.bucket
      @push[:directory] = @op.directory
      @push[:acl] = @op.acl
      @push[:file_prefix] = @op.file_prefix
      @push[:max_size] = @op.max_size
      return @push
    end

    def sftp
    end

    def splunkstormrest
    end

    def splunkenterprise
    end

    def zoomdata
    end




  end
end

