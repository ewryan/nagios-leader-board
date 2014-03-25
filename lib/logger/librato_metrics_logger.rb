require 'librato/metrics'

class LibratoMetricsLogger

  def initialize config
    @config = config
  end

  def submit metrics
    Librato::Metrics.authenticate @config["librato_email_addy"], @config["librato_api_token"]
    Librato::Metrics.submit metrics
  end

end

