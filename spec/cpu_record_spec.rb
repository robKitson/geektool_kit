require 'spec_helper'

describe GeektoolKit::CpuRecord do

  before(:all) do

    @big_record = GeektoolKit::CpuRecord.new({name:"big process", percent:78.2})
    @small_record = GeektoolKit::CpuRecord.new({name:"small proecess that has a long name", percent:1.1})
  end

  describe "creating records from input" do
    it "should return 8 records when 8 are provided" do
      
      output = "COMMAND           %CPU\nWindowServer      13.2\nMail              11.5\nGoogle Chrome He   7.7\nSpotify            3.8\ncoreaudiod         1.8\nTerminal           1.3\nSpringBoard        1.2\ndiscoveryd         1.1\n"
      
      allow(GeektoolKit::CpuRecord).to receive(:get_data).and_return(output)

      records = GeektoolKit::CpuRecord.get_records

      expect(records.count).to be 8
    end

    it "should return 1 records when 1 is provided" do
      
      output = "WindowServer      13.2"
      
      allow(GeektoolKit::CpuRecord).to receive(:get_data).and_return(output)

      records = GeektoolKit::CpuRecord.get_records

      expect(records.count).to be 1
      expect(records[0].name).to eq "WindowServer"
      expect(records[0].percent).to be 13.2
    end
  end

  describe "sorting" do
    it "should sort by number of bytes (descending)" do

      list = [@small_record, @big_record]
      list.sort!

      expect(list.first).to be @big_record
      expect(list.last).to be @small_record
    end
  end

  describe "create_memory_display_text" do
    it "should work for small record" do
      expect(@small_record.create_percent_display_text).to eq "1.1%"
    end

    it "should work for big record" do
      expect(@big_record.create_percent_display_text).to eq "78.2%"
    end
  end

  describe "create_display_text" do
    it "should work for small record" do
      expect(@small_record.create_display_text).to eq "small proecess that has a 1.1%"
    end
    
    it "should work for big record" do
      expect(@big_record.create_display_text).to eq "big process              78.2%"
    end
  end
end