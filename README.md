# crystal_talib

Crystal bindings for the [TA-lib](http://ta-lib.org/) library.  TA-Lib performs technical analysis of financial market data.

## Installation (only tested on Linux so far)

1. [Download](https://versaweb.dl.sourceforge.net/project/ta-lib/ta-lib/0.4.0/ta-lib-0.4.0-src.tar.gz) and build TA-lib (`./configure && make`)

2. Copy the contents of `src/.libs` to `/usr/lib`

3. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crystal_talib:
       github: your-github-user/crystal_talib
   ```

4. Run `shards install`

## Usage

```crystal
require "crystal_talib"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/crystal_talib/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nick Franken](https://github.com/your-github-user) - creator and maintainer
