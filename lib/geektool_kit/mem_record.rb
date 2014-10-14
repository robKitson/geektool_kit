require 'geektool_kit/line_formatter'

module GeektoolKit
  class MemRecord
    include GeektoolKit::LineFormatter

    BYTES_IN_A_MEG = 1048576

    attr_accessor :name
    attr_accessor :bytes

    def initialize line
      self.name = line[:name].strip
      self.bytes = line[:bytes].to_i * 1024
    end

    def <=> other
      return other.bytes <=> self.bytes
    end

    def create_memory_display_text precision = 2
      get_display_value(precision) + get_display_unit
    end

    def create_display_text max_width = 30
      create_line name, create_memory_display_text, max_width
    end

    def self.get_data
      %x{ps -arcwwwxo "command rss" -m}
    end

    def self.get_records

      data = self.get_data.split("\n")
      
      records = []
      data.each do |d|
        matches = /(?<name>.*)\s(?<bytes>\d+)/.match(d)
        records << MemRecord.new(matches) unless matches.nil?
      end

      return records
    end

    
    private

    def get_display_unit
      bytes / BYTES_IN_A_MEG >= 1024 ? "G" : "M"
    end

    def get_display_value precision = 2
      result = bytes.to_f / BYTES_IN_A_MEG
      if (result >= 1024)
        result /= 1024
      end
      "%.#{precision}f" % result
    end
  end
end