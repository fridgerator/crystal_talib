require "json"
require "./libta_lib"

module CrystalTalib
  extend self
  VERSION = "0.1.0"

  # execute: https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L554

  # TODO: free all the things
  def execute(
    name : String,
    start_idx : Int32,
    end_idx : Int32,
    open : Array(Float64)? = nil,
    high : Array(Float64)? = nil,
    low : Array(Float64)? = nil,
    close : Array(Float64)? = nil,
    volume : Array(Float64)? = nil,
    openinterest : Array(Float64)? = nil,
    **optional_args
    )
    if start_idx < 0 || end_idx < 0
      pp "start_idx and end_idx need to be positive"
      exit 1
    end

    if start_idx > end_idx
      pp "start_idx needs to be smaller end_idx"
      exit 1
    end

    # get function handle
    # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L655
    ret_code = LibTaLib.get_func_handle(name, out handle)
    if ret_code != LibTaLib::RetCode::Success
      pp "get_func_handle failed: #{ret_code}"
      exit 1
    end

    # get function info
    # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L661
    ret_code = LibTaLib.get_func_info(handle, out func_info)
    if ret_code != LibTaLib::RetCode::Success
      pp "get_func_info failed: #{ret_code}"
      exit 1
    end

    # param holder alloc
    # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L667
    ret_code = LibTaLib.param_holder_alloc(handle, out func_params)
    if ret_code != LibTaLib::RetCode::Success
      pp "param_holder_alloc failed: #{ret_code}"
      exit 1
    end

    # Loop for all the input parameters
    (0..func_info.value.nb_input - 1).each do |i|
      ret_code = LibTaLib.get_input_parameter_info(func_info.value.handle, i, out input_paraminfo)
      if ret_code != LibTaLib::RetCode::Success
        pp "get_input_parameter_info failed: #{ret_code}"
        exit 1
      end
      
      case input_paraminfo.value.type
      when LibTaLib::InputParameterType::InputPrice

        open_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPEN) != 0
        # pp "open required : #{open_required}"
        if open_required && open.nil?
          LibTaLib.param_holder_free(func_params)
          pp "open argument is required"
          return nil
        end

        high_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_HIGH) != 0
        if high_required && high.nil?
          LibTaLib.param_holder_free(func_params)
          pp "high argument is required"
          return nil
        end

        low_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_LOW) != 0
        if low_required && low.nil?
          LibTaLib.param_holder_free(func_params)
          pp "low argument is required"
          return nil
        end

        close_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_CLOSE) != 0
        if close_required && close.nil?
          LibTaLib.param_holder_free(func_params)
          pp "close argument is required"
          return nil
        end

        volume_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_VOLUME) != 0
        if volume_required && volume.nil?
          LibTaLib.param_holder_free(func_params)
          pp "volume argument is required"
          return nil
        end

        openinterest_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPENINTEREST) != 0
        if openinterest_required && openinterest.nil?
          LibTaLib.param_holder_free(func_params)
          pp "openinterest argument is required"
          return nil
        end

        # set_input_param_price_ptr = TA_SetInputParamPricePtr(
        #  params : ParamHolder*,
        #  param_index : LibC::UInt,
        #  open : Real*,
        #  high : Real*,
        #  low : Real*,
        #  close : Real*,
        #  volume : Real*,
        #  open_interest : Real*) : RetCode
        open_param = open ? open : Array(Float64).new
        high_param = high ? high : Array(Float64).new
        low_param = low ? low : Array(Float64).new
        close_param = low ? low : Array(Float64).new
        volume_param = low ? low : Array(Float64).new
        openinterest_param = low ? low : Array(Float64).new

        # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L858
        ret_code = LibTaLib.set_input_param_price_ptr(
          func_params,
          i,
          open_param.to_unsafe,
          high_param.to_unsafe,
          low_param.to_unsafe,
          close_param.to_unsafe,
          volume_param.to_unsafe,
          openinterest_param.to_unsafe
        )

        if ret_code != LibTaLib::RetCode::Success
          LibTaLib.param_holder_free(func_params)
          pp "set_input_param_price_ptr failed: #{ret_code}"
          exit 1
        end

      when LibTaLib::InputParameterType::InputReal

        pp "TODO: InputParameterType::InputReal"

      when LibTaLib::InputParameterType::InputInteger

        pp "TODO: InputParameterType::InputInteger"

      end
    end

    # Loop for all the optional input parameters
    # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L940
    pp "func_info.value.nb_opt_input #{func_info.value.nb_opt_input}"
    (0..func_info.value.nb_opt_input - 1).each do |i|

      ret_code = LibTaLib.get_opt_input_parameter_info(
        func_info.value.handle,
        i,
        out opt_paraminfo
      )
      if ret_code != LibTaLib::RetCode::Success
        LibTaLib.param_holder_free(func_params)
        pp "get_opt_input_parameter_info failed: #{ret_code}"
        exit 1
      end

      param_name = String.new(opt_paraminfo.value.param_name).underscore

      unless optional_args[param_name]?
        LibTaLib.param_holder_free(func_params)
        pp "argument #{param_name} is required"
        return nil
      end

      # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L959
      case opt_paraminfo.value.type
      when LibTaLib::OptInputParameterType::OptInputRealRange, LibTaLib::OptInputParameterType::OptInputRealList
        ret_code = LibTaLib.set_opt_input_param_real(func_params, i, optional_args[param_name])
        if ret_code != LibTaLib::RetCode::Success
          LibTaLib.param_holder_free(func_params)
          pp "set_opt_input_param_real failed: #{ret_code}"
          exit 1
        end

      when LibTaLib::OptInputParameterType::OptInputIntegerRange, LibTaLib::OptInputParameterType::OptInputIntegerList
        ret_code = LibTaLib.set_opt_input_param_integer(func_params, i, optional_args[param_name])
        if ret_code != LibTaLib::RetCode::Success
          LibTaLib.param_holder_free(func_params)
          pp "set_opt_input_param_integer failed: #{ret_code}"
          exit 1
        end
      end
    end

    out_real = Array(Array(Float64)).new
    # out_int = Array(Int32).new(func_info.value.nb_output)

    # Loop for all the ouput parameters
    # https://github.com/oransel/node-talib/blob/master/src/talib.cpp#L1016
    pp "func_info.value.nb_output : #{func_info.value.nb_output}"
    (0..func_info.value.nb_output - 1).each do |i|
      # inner = Array(Float64).new
      # (0..((end_idx-start_idx+1) - 1)).each do |x|
      #   inner.push(0.0)
      # end
      # out_real.push(inner)

      ret_code = LibTaLib.get_output_parameter_info(
        func_info.value.handle,
        i,
        out output_paraminfo
      )

      if ret_code != LibTaLib::RetCode::Success
        pp "get_output_parameter_info failed: #{ret_code}"
        exit 1
      end

      case output_paraminfo.value.type
      when LibTaLib::OutputParameterType::OutputReal
        # real_val = uninitialized Float64
        # real_val = Array(Float64).new
        # pp real_val.to_unsafe.class
        # x = out_real[i]
        ret_code = LibTaLib.set_output_param_real_ptr(func_params, i, out real_val)
        if ret_code != LibTaLib::RetCode::Success
          pp "set_output_param_real_ptr failed: #{ret_code}"
          exit 1
        end
        x = pointerof(real_val).as(Array(Float64))
        # pp x
        # pp real_val
        # out_real[i] = real_val
        # x = real_val as Pointer(Array(Float64))
        # pp "real val : #{real_val as Pointer(Array(Float64))}"
        # pp "readl val #{real_val}"
        out_real.push(x)
      when LibTaLib::OutputParameterType::OutputInteger
        pp "output i"
        # int_val = uninitialized Int32
        # ret_code = LibTaLib.set_output_param_integer_ptr(func_params, i, pointerof(int_val))
        # if ret_code != LibTaLib::RetCode::Success
        #   pp "set_output_param_integer_ptr failed: #{ret_code}"
        #   exit 1
        # end
        # # out_int[i] = real_val
        # out_real.push(int_val.to_f)
      end
    end

    pp out_real[0].size

    # call_func = TA_CallFunc(params : ParamHolder*, start_idx : Integer, end_idx : Integer, out_beg_idx : Integer*, out_nb_element : Integer*)
    ret_code = LibTaLib.call_func(
      func_params,
      start_idx,
      end_idx,
      out beg_idx,
      out nb_element
    )
    if ret_code != LibTaLib::RetCode::Success
      pp "call_func failed: #{ret_code}"
      exit 1
    end

    # Loop for all the output parameters
    (0..func_info.value.nb_output - 1).each do |i|
      ret_code = LibTaLib.get_output_parameter_info(
        func_info.value.handle,
        i,
        out output_paraminfo
      )
      if ret_code != LibTaLib::RetCode::Success
        pp "get_output_parameter_info failed: #{ret_code}"
        exit 1
      end

      out_array = Array(Float64).new

      pp "nb_element : #{nb_element}"

      (0..nb_element-1).each do |y|
        # case output_paraminfo.value.type
        # when LibTaLib::OutputParameterType::OutputReal
        # when LibTaLib::OutputParameterType::OutputInteger
        # end
      end

      pp String.new(output_paraminfo.value.param_name)

      pp "out real #{out_real}"
    end
  end
end

contents = File.read("./spec/marketdata.json")
# json = JSON.parse(contents)

class MarketData
  include JSON::Serializable

  property high : Array(Float64)
  property low : Array(Float64)
  property close : Array(Float64)
end

market_data = MarketData.from_json(contents)

result = CrystalTalib.execute(
  "ADX",
  start_idx: 0,
  end_idx: market_data.close.size - 1,
  high: market_data.high,
  low: market_data.low,
  close: market_data.close,
  opt_in_time_period: 9
)

pp "result #{result}"
