class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.split(' ').drop(1).join(' ')
  end

  def log_level
    @line.split(' ').shift.gsub(/\W/, "").downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
