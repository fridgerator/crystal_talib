require "./spec_helper"
require "../src/crystal_talib"

describe CrystalTalib do
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
