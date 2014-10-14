require 'spec_helper'

describe GeektoolKit::MemRecord do

  before(:all) do

    @big_record = GeektoolKit::MemRecord.new({name:"big process", bytes:2000000000/1024})
    @small_record = GeektoolKit::MemRecord.new({name:"small proecess that has a long name", bytes:10000000/1024})
  end

  describe "creating records from input" do
    it "should return 8 records when 8 are provided" do
      
      output = "COMMAND             RSS\nGoogle Chrome    119920\nSkype            101352\nGoogle Chrome He  99492\nTweetbot          88788\nEvernote          87756\nSystemUIServer    77464\nGoogle Chrome He  76056\nGoogle Chrome He  74828"
      
      allow(GeektoolKit::MemRecord).to receive(:get_data).and_return(output)

      records = GeektoolKit::MemRecord.get_records

      expect(records.count).to be 8
    end

    it "should return 1 records when 1 is provided" do
      
      output = "Google Chrome    119920"
      
      allow(GeektoolKit::MemRecord).to receive(:get_data).and_return(output)

      records = GeektoolKit::MemRecord.get_records

      expect(records.count).to be 1
      expect(records[0].name).to eq "Google Chrome"
      expect(records[0].bytes).to be 122798080
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

  describe "get_unit" do
    it "should return M when less than a gig" do
      actual = @small_record.send(:get_display_unit)
      expect(actual).to eq "M"
    end

    it "should return G when more than a gig" do\
      actual = @big_record.send(:get_display_unit)
      expect(actual).to eq "G"
    end
  end

  describe "get_display_value" do
    it "should return display value for megs" do
      actual = @small_record.send(:get_display_value)
      expect(actual).to eq "9.54"
    end

    it "should return display value for gigs" do
      actual = @big_record.send(:get_display_value)
      expect(actual).to eq "1.86"
    end
  end

  describe "create_memory_display_text" do
    it "should work for megs" do
      expect(@small_record.create_memory_display_text).to eq "9.54M"
    end

    it "should work for gigs" do
      expect(@big_record.create_memory_display_text).to eq "1.86G"
    end
  end

  describe "create_display_text" do
    
    it "should work for megs" do
      expect(@small_record.create_display_text).to eq "small proecess that has  9.54M"
    end
    
    it "should work for gigs" do
      expect(@big_record.create_display_text).to eq "big process              1.86G"
    end
  end
end