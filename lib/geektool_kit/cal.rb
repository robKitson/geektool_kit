
module GeektoolKit
  class Cal

    def self.get_data
      `cal`
    end

    def self.get_day
      Time.now.day.to_s
    end

    def self.display
      cal = get_data
      output = ""
      cal.gsub(/(?<leading>\s)(?<date>#{get_day})(?<trailing>\s)/) {|match| output = cal.gsub(match, "#{$~[:leading]}#{Colors.GREEN}#{$~[:date]}#{Colors.RESET}#{$~[:trailing]}")}
      output
    end

  end
end