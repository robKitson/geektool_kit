require 'spec_helper'

describe GeektoolKit::Cal do 

  before(:all) do
    @plain_month = "    October 2014\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"
  end

  it "should highlight the 1st when it's the 1st" do
      
    allow(GeektoolKit::Cal).to receive(:get_data).and_return(@plain_month)
    allow(GeektoolKit::Cal).to receive(:get_day).and_return(1)

    output = GeektoolKit::Cal.display

    expect(output).to eq "    October 2014\nSu Mo Tu We Th Fr Sa\n          \e[32m1\e[0m  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"
  end

  it "should highlight the 5th when it's the 5th" do
      
    allow(GeektoolKit::Cal).to receive(:get_data).and_return(@plain_month)
    allow(GeektoolKit::Cal).to receive(:get_day).and_return(5)

    output = GeektoolKit::Cal.display

    expect(output).to eq "    October 2014\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n \e[32m5\e[0m  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"
  end

  it "should highlight the 13th when it's the 13th" do
      
    allow(GeektoolKit::Cal).to receive(:get_data).and_return(@plain_month)
    allow(GeektoolKit::Cal).to receive(:get_day).and_return(13)

    output = GeektoolKit::Cal.display

    expect(output).to eq "    October 2014\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 \e[32m13\e[0m 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 31\n\n"
  end

  it "should highlight the 25th when it's the 13th" do
      
    allow(GeektoolKit::Cal).to receive(:get_data).and_return(@plain_month)
    allow(GeektoolKit::Cal).to receive(:get_day).and_return(25)

    output = GeektoolKit::Cal.display

    expect(output).to eq "    October 2014\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 \e[32m25\e[0m\n26 27 28 29 30 31\n\n"
  end

  it "should highlight the 31st when it's the 31st" do
      
    allow(GeektoolKit::Cal).to receive(:get_data).and_return(@plain_month)
    allow(GeektoolKit::Cal).to receive(:get_day).and_return(31)

    output = GeektoolKit::Cal.display

    expect(output).to eq "    October 2014\nSu Mo Tu We Th Fr Sa\n          1  2  3  4\n 5  6  7  8  9 10 11\n12 13 14 15 16 17 18\n19 20 21 22 23 24 25\n26 27 28 29 30 \e[32m31\e[0m\n\n"
  end
end