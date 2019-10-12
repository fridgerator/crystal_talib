require "./spec_helper"
require "../src/crystal_talib"

describe CrystalTalib do
  describe "#functions" do
    it "should print the lib functions" do
      result = CrystalTalib.functions
      result.should_not be_empty
    end
  end

  describe "#explain" do
    it "ADX" do
      result = CrystalTalib.explain("ADX")

      result[:name].should eq("ADX")
      result[:group].should eq("Momentum Indicators")
      result[:hint].should eq("Average Directional Movement Index")

      result[:inputs][0][:name].should eq("inPriceHLC")
      result[:inputs][0][:type].should eq("price")
      result[:inputs][0][:flags].should eq(["high", "low", "close"])

      result[:opt_inputs][0][:name].should eq("optInTimePeriod")
      result[:opt_inputs][0][:display_name].should eq("Time Period")
      result[:opt_inputs][0][:hint].should eq("Number of period")
      result[:opt_inputs][0][:type].should eq("integer_range")
      result[:opt_inputs][0][:flags].should eq([] of String)

      result[:outputs][0][:name].should eq("outReal")
      result[:outputs][0][:type].should eq("real")
      result[:outputs][0][:flags].should eq(["line"])
    end
  end

  describe "#execute" do
    it "ADX" do
      market_data = get_market_data()
      result = CrystalTalib.execute(
        "ADX",
        start_idx: 0,
        end_idx: market_data.close.size - 1,
        high: market_data.high,
        low: market_data.low,
        close: market_data.close,
        opt_in_time_period: 9
      )

      result[:beg_index].should be_a(Int32)
      result[:nb_element].should be_a(Int32)
      result[:result].should be_a(Hash(String, Array(Float64)))
    end

    it "SMA" do
      market_data = get_market_data()
      result = CrystalTalib.execute(
        name: "SMA",
        start_idx: 0,
        end_idx: market_data.close.size - 1,
        in_real: market_data.close,
        opt_in_time_period: 180
      )

      result[:beg_index].should be_a(Int32)
      result[:nb_element].should be_a(Int32)
      result[:result].should be_a(Hash(String, Array(Float64)))
    end
  end
end
