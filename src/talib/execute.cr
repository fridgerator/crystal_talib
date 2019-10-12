module CrystalTalib
  module Execute
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
        raise Exception.new("start_idx and end_idx need to be positive")
      end
  
      if start_idx > end_idx
        raise Exception.new("start_idx needs to be smaller end_idx")
      end
  
      # get function handle
      ret_code = LibTaLib.get_func_handle(name, out handle)
      if ret_code != LibTaLib::RetCode::Success
        raise Exception.new("get_func_handle failed: #{ret_code}")
      end
  
      # get function info
      ret_code = LibTaLib.get_func_info(handle, out func_info)
      if ret_code != LibTaLib::RetCode::Success
        raise Exception.new("get_func_info failed: #{ret_code}")
      end
  
      # param holder alloc
      ret_code = LibTaLib.param_holder_alloc(handle, out func_params)
      if ret_code != LibTaLib::RetCode::Success
        raise Exception.new("param_holder_alloc failed: #{ret_code}")
      end
  
      # Loop for all the input parameters
      (0..func_info.value.nb_input - 1).each do |i|
        ret_code = LibTaLib.get_input_parameter_info(func_info.value.handle, i, out input_paraminfo)
        if ret_code != LibTaLib::RetCode::Success
          LibTaLib.param_holder_free(func_params)
          raise Exception.new("get_input_parameter_info failed: #{ret_code}")
        end
  
        case input_paraminfo.value.type
        when LibTaLib::InputParameterType::InputPrice
          open_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPEN) != 0
          if open_required && open.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("open argument is required")
          end
  
          high_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_HIGH) != 0
          if high_required && high.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("high argument is required")
          end
  
          low_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_LOW) != 0
          if low_required && low.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("low argument is required")
          end
  
          close_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_CLOSE) != 0
          if close_required && close.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("close argument is required")
          end
  
          volume_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_VOLUME) != 0
          if volume_required && volume.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("volume argument is required")
          end
  
          openinterest_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPENINTEREST) != 0
          if openinterest_required && openinterest.nil?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("openinterest argument is required")
          end
  
          open_param = open ? open : Array(Float64).new
          high_param = high ? high : Array(Float64).new
          low_param = low ? low : Array(Float64).new
          close_param = low ? low : Array(Float64).new
          volume_param = low ? low : Array(Float64).new
          openinterest_param = low ? low : Array(Float64).new
  
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
            raise Exception.new("set_input_param_price_ptr failed: #{ret_code}")
          end
        when LibTaLib::InputParameterType::InputReal
          pname = String.new(input_paraminfo.value.param_name).underscore
  
          unless optional_args[pname]?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("argument #{pname} required")
          end
  
          arg = optional_args[pname]
          if (arg.is_a?(Array(Float64)))
            ret_code = LibTaLib.set_input_param_real_ptr(func_params, i, arg.to_unsafe)
            if ret_code != LibTaLib::RetCode::Success
              LibTaLib.param_holder_free(func_params)
              raise Exception.new("set_input_param_real_ptr failed: #{ret_code}")
            end
          end
        when LibTaLib::InputParameterType::InputInteger
          pname = String.new(input_paraminfo.value.param_name).underscore
  
          unless optional_args[pname]?
            LibTaLib.param_holder_free(func_params)
            raise Exception.new("argument #{pname} required")
          end
  
          arg = optional_args[pname]
          if (arg.is_a?(Array(Int32)))
            ret_code = LibTaLib.set_input_param_real_ptr(func_params, i, arg.to_unsafe)
            if ret_code != LibTaLib::RetCode::Success
              LibTaLib.param_holder_free(func_params)
              raise Exception.new("set_input_param_real_ptr failed: #{ret_code}")
            end
          end
        end
      end
  
      # Loop for all the optional input parameters
      (0..func_info.value.nb_opt_input - 1).each do |i|
        ret_code = LibTaLib.get_opt_input_parameter_info(
          func_info.value.handle,
          i,
          out opt_paraminfo
        )
        if ret_code != LibTaLib::RetCode::Success
          LibTaLib.param_holder_free(func_params)
          raise Exception.new("get_opt_input_parameter_info failed: #{ret_code}")
        end
  
        param_name = String.new(opt_paraminfo.value.param_name).underscore
  
        unless optional_args[param_name]?
          LibTaLib.param_holder_free(func_params)
          raise Exception.new("argument #{param_name} is required")
        end
  
        case opt_paraminfo.value.type
        when LibTaLib::OptInputParameterType::OptInputRealRange,
             LibTaLib::OptInputParameterType::OptInputRealList
          arg = optional_args[param_name]
          if (arg.is_a?(Float64))
            ret_code = LibTaLib.set_opt_input_param_real(func_params, i, arg)
            if ret_code != LibTaLib::RetCode::Success
              LibTaLib.param_holder_free(func_params)
              raise Exception.new("set_opt_input_param_real failed: #{ret_code}")
            end
          end
        when LibTaLib::OptInputParameterType::OptInputIntegerRange,
             LibTaLib::OptInputParameterType::OptInputIntegerList
          arg = optional_args[param_name]
          if (arg.is_a?(Int32))
            ret_code = LibTaLib.set_opt_input_param_integer(func_params, i, arg)
            if ret_code != LibTaLib::RetCode::Success
              LibTaLib.param_holder_free(func_params)
              raise Exception.new("set_opt_input_param_integer failed: #{ret_code}")
            end
          end
        end
      end
  
      out_real = Array(Array(Float64)).new
      # out_int = Array(Array(Int32)).new
  
      # Loop for all the ouput parameters
      (0..func_info.value.nb_output - 1).each do |i|
        inner = Array(Float64).new(end_idx + start_idx, 0.0)
        out_real.push(inner)
  
        ret_code = LibTaLib.get_output_parameter_info(
          func_info.value.handle,
          i,
          out output_paraminfo
        )
  
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("get_output_parameter_info failed: #{ret_code}")
        end
  
        case output_paraminfo.value.type
        when LibTaLib::OutputParameterType::OutputReal
          ret_code = LibTaLib.set_output_param_real_ptr(func_params, i, out_real[i].to_unsafe)
          if ret_code != LibTaLib::RetCode::Success
            raise Exception.new("set_output_param_real_ptr failed: #{ret_code}")
          end
        when LibTaLib::OutputParameterType::OutputInteger
          raise Exception.new("TODO: output int")
        end
      end
  
      ret_code = LibTaLib.call_func(
        func_params,
        start_idx,
        end_idx,
        out beg_idx,
        out nb_element
      )
      LibTaLib.param_holder_free(func_params)
      if ret_code != LibTaLib::RetCode::Success
        raise Exception.new("call_func failed: #{ret_code}")
      end
  
      results = Hash(String, Array(Float64)).new
  
      results = {
        beg_index:  beg_idx,
        nb_element: nb_element,
        result:     Hash(String, Array(Float64)).new,
      }
  
      # Loop for all the output parameters
      (0..func_info.value.nb_output - 1).each do |i|
        ret_code = LibTaLib.get_output_parameter_info(
          func_info.value.handle,
          i,
          out output_paraminfo
        )
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("get_output_parameter_info failed: #{ret_code}")
        end
  
        out_array = Array(Float64).new
  
        (0..nb_element - 1).each do |x|
          case output_paraminfo.value.type
          when LibTaLib::OutputParameterType::OutputReal
            out_array.push(out_real[i][x])
          when LibTaLib::OutputParameterType::OutputInteger
            raise Exception.new("TODO: output int")
          end
        end
  
        param_name = String.new(output_paraminfo.value.param_name)
        results[:result][param_name] = out_array
      end
  
      return results
    end
  end
end