require "spec"
require "../src/crystal_talib"

class MarketData
  include JSON::Serializable

  property high : Array(Float64)
  property low : Array(Float64)
  property close : Array(Float64)
end

def get_market_data : MarketData
  contents = File.read("./spec/marketdata.json")
  MarketData.from_json(contents)
end
