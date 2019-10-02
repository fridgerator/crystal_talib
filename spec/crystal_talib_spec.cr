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

      result.should_not be_nil
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

      result.should_not be_nil
    end
  end
end
