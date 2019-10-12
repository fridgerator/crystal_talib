# crystal_talib

Crystal bindings for the [TA-lib](http://ta-lib.org/) library.  TA-Lib performs technical analysis of financial market data.

## Installation (only tested on Linux so far)

1. [Download](https://versaweb.dl.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz) and build TA-lib (`./configure && make`)

2. Copy the contents of `src/.libs` to `/usr/lib`

3. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal_talib:
       github: fridgerator/crystal_talib
   ```

4. Run `shards install`

## Usage

```crystal
require "crystal_talib"

# List all TA-LIB functions
functions = result = CrystalTalib.functions
functions # Array(String)

# Execute a TA-LIB function
market_data = { open: Array(Float64), close: Array(Float64), high: Array(Float64), low: Array(Float64), volume: Array(Float64) }
result = CrystalTalib.execute(
  "ADX",
  start_idx: 0,
  end_idx: market_data.close.size - 1,
  high: market_data.high,
  low: market_data.low,
  close: market_data.close,
  opt_in_time_period: 9
)

result.beg_index # Int32
result.nb_element # Int32
result.result #  Hash(String, Array(Float64))

# Discover input and output parameters of functions
function_description = CrystalTalib.explain("ADX")
```

## Contributing

1. Fork it (<https://github.com/fridgerator/crystal_talib/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nick Franken](https://github.com/fridgerator) - creator and maintainer
