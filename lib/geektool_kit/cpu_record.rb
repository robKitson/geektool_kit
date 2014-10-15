require 'geektool_kit/line_formatter'

module GeektoolKit
  class CpuRecord
    include GeektoolKit::LineFormatter
    
    NORMAL_RANGE = 0..9
    ELEVATED_RANGE = 10..19
    WARNING_RANGE = 20..29
    CRITICAL_RANGE = 30..200
    
    attr_accessor :name
    attr_accessor :percent

    def initialize line
      
      self.name = line[:name].strip
      self.percent = line[:percent].to_f
    end

    def is_valid?
      !self.name.nil? && !self.percent.nil?
    end

    def is_consequential?
      !percent.nil? && percent.to_i > 1
    end

    def color
      case percent.to_i
         when NORMAL_RANGE then Colors.DEFAULT
         when ELEVATED_RANGE then Colors.CYAN
         when WARNING_RANGE then Colors.YELLOW
         when CRITICAL_RANGE then Colors.RED
         else Colors.RED
      end
    end

    def print
      puts colorize_line(create_display_text)
    end

    def <=> other
      return other.percent <=> self.percent
    end

    def create_percent_display_text precision = 1
      "#{"%.#{precision}f" % percent}%"
    end

    def create_display_text max_width = 30
      create_line(name, create_percent_display_text, max_width)
    end

    def colorize_line line
      "#{color}#{line}#{Colors.RESET}"
    end

    def self.get_data
      %x{ps -arcwwwxo "command %cpu"}
    end

    def self.get_records

      data = self.get_data.split("\n")
      
      records = []
      data.each do |d|
        matches = /(?<name>.*)\s+(?<percent>\d{1,}\.\d+)/.match(d)
        records << CpuRecord.new(matches) unless matches.nil?
      end

      return records
    end
  end
end