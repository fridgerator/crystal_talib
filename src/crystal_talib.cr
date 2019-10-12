require "json"
require "./libta_lib"
require "./talib/*"

module CrystalTalib
  extend self
  VERSION = "0.1.0"

  extend Execute
  extend Explain
end
