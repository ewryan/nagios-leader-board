require 'nagios_analyzer'

class NagiosLogParser

  def collect
    root_dir = "#{File.dirname(__FILE__)}/../"
    @status = NagiosAnalyzer::Status.new("#{root_dir}/data/status.dat")

    {
        :critical_alerts => @status.service_problems.select { |check| check.status == "CRITICAL" }.size,
        :warning_alerts => @status.service_problems.select { |check| check.status == "WARNING" }.size
    }
  end

end


