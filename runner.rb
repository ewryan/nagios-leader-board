require 'bundler'
require 'yaml'

require 'require_all'
require_all 'lib'

def config
  unless @config
    config_file_path = "config/config.yml"
    @config = YAML.load_file(config_file_path)
  end
  @config
end

@logger = case config["logger"]
            when "librato"
              LibratoMetricsLogger.new config
            when "stdout"
              StdoutMetricsLogger.new
            else
              raise "unknown logger!"
          end

@parser = NagiosLogParser.new
metrics = @parser.collect
@logger.submit metrics