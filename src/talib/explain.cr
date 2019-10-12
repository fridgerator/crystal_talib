module CrystalTalib
  module Explain
    def explain(name : String)
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

      response = {
        name: String.new(func_info.value.name),
        group: String.new(func_info.value.group),
        hint: String.new(func_info.value.hint),
        inputs: Array(NamedTuple(name: String, type: String | Nil, flags: Array(String))).new,
        opt_inputs: Array(NamedTuple(name: String, display_name: String, default_value: Float64, hint: String, type: String | Nil, flags: Array(String))).new,
        outputs: Array(NamedTuple(name: String, type: String | Nil, flags: Array(String))).new
      }

      # loop for all input parameters
      (0..func_info.value.nb_input - 1).each do |i|
        ret_code = LibTaLib.get_input_parameter_info(func_info.value.handle, i, out input_paraminfo)
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("get_input_parameter_info failed: #{ret_code}")
        end

        type = case input_paraminfo.value.type
        when LibTaLib::InputParameterType::InputPrice
          "price"
        when LibTaLib::InputParameterType::InputReal
          "real"
        when LibTaLib::InputParameterType::InputInteger
          "integer"
        end

        flags = Array(String).new

        if input_paraminfo.value.flags > 0
          open_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPEN) != 0
          flags.push("open") if open_required

          high_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_HIGH) != 0
          flags.push("high") if high_required

          low_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_LOW) != 0
          flags.push("low") if low_required

          close_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_CLOSE) != 0
          flags.push("close") if close_required

          volume_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_VOLUME) != 0
          flags.push("volume") if volume_required

          openinterest_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_OPENINTEREST) != 0
          flags.push("openinterest") if openinterest_required

          timestamp_required = (input_paraminfo.value.flags & LibTaLib::IN_PRICE_TIMESTAMP) != 0
          flags.push("timestamp") if timestamp_required
        end

        input = {
          name: String.new(input_paraminfo.value.param_name),
          type: type,
          flags: flags
        }

        response[:inputs].push(input)
      end

      # loop through all optional parameters
      (0..func_info.value.nb_opt_input - 1).each do |i|
        ret_code = LibTaLib.get_opt_input_parameter_info(
          func_info.value.handle,
          i,
          out opt_paraminfo
        )
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("get_opt_input_parameter_info failed: #{ret_code}")
        end

        t = case opt_paraminfo.value.type
        when LibTaLib::OptInputParameterType::OptInputRealRange then "real_range"
        when LibTaLib::OptInputParameterType::OptInputRealList then "real_list"
        when LibTaLib::OptInputParameterType::OptInputIntegerRange then "integer_range"
        when LibTaLib::OptInputParameterType::OptInputIntegerList then "integer_list"
        end

        flags = Array(String).new

        if opt_paraminfo.value.flags > 0
          percent_required = (opt_paraminfo.value.flags & LibTaLib::OPTIN_IS_PERCENT) != 0
          flags.push("percent") if percent_required

          degree_required = (opt_paraminfo.value.flags & LibTaLib::OPTIN_IS_DEGREE) != 0
          flags.push("degree") if degree_required

          currency_required = (opt_paraminfo.value.flags & LibTaLib::OPTIN_IS_CURRENCY) != 0
          flags.push("currency") if currency_required

          advanced_required = (opt_paraminfo.value.flags & LibTaLib::OPTIN_ADVANCED) != 0
          flags.push("advanced") if advanced_required
        end

        opt_input = {
          name: String.new(opt_paraminfo.value.param_name),
          display_name: String.new(opt_paraminfo.value.display_name),
          default_value: opt_paraminfo.value.default_value,
          hint: String.new(opt_paraminfo.value.hint),
          type: t,
          flags: flags
        }

        response[:opt_inputs].push(opt_input)
      end
      
      # loop through all output parameters
      (0..func_info.value.nb_output - 1).each do |i|
        ret_code = LibTaLib.get_output_parameter_info(
          func_info.value.handle,
          i,
          out output_paraminfo
        )
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("get_output_parameter_info failed: #{ret_code}")
        end

        t = case output_paraminfo.value.type
        when LibTaLib::OutputParameterType::OutputReal then "real"
        when LibTaLib::OutputParameterType::OutputInteger then "integer"
        end

        flags = Array(String).new

        if output_paraminfo.value.flags > 0
          line_required = (output_paraminfo.value.flags & LibTaLib::OUT_LINE) != 0
          flags.push("line") if line_required

          line_dot_required = (output_paraminfo.value.flags & LibTaLib::OUT_DOT_LINE) != 0
          flags.push("line_dot") if line_dot_required

          line_dash_required = (output_paraminfo.value.flags & LibTaLib::OUT_DASH_LINE) != 0
          flags.push("line_dash") if line_dash_required

          dot_required = (output_paraminfo.value.flags & LibTaLib::OUT_DOT) != 0
          flags.push("dot") if dot_required

          histogram_required = (output_paraminfo.value.flags & LibTaLib::OUT_HISTO) != 0
          flags.push("histogram") if histogram_required

          pattern_bool_required = (output_paraminfo.value.flags & LibTaLib::OUT_PATTERN_BOOL) != 0
          flags.push("pattern_bool") if pattern_bool_required

          pattern_bull_bear_required = (output_paraminfo.value.flags & LibTaLib::OUT_PATTERN_BULL_BEAR) != 0
          flags.push("pattern_bull_bear") if pattern_bull_bear_required

          pattern_strength_required = (output_paraminfo.value.flags & LibTaLib::OUT_PATTERN_STRENGTH) != 0
          flags.push("pattern_strength") if pattern_strength_required

          positive_required = (output_paraminfo.value.flags & LibTaLib::OUT_POSITIVE) != 0
          flags.push("positive") if positive_required

          negative_required = (output_paraminfo.value.flags & LibTaLib::OUT_NEGATIVE) != 0
          flags.push("negative") if negative_required

          zero_required = (output_paraminfo.value.flags & LibTaLib::OUT_ZERO) != 0
          flags.push("zero") if zero_required

          limit_upper_required = (output_paraminfo.value.flags & LibTaLib::OUT_UPPER_LIMIT) != 0
          flags.push("limit_upper") if limit_upper_required

          limit_lower_required = (output_paraminfo.value.flags & LibTaLib::OUT_LOWER_LIMIT) != 0
          flags.push("limit_lower") if limit_lower_required
        end

        output = {
          name: String.new(output_paraminfo.value.param_name),
          type: t,
          flags: flags
        }

        response[:outputs].push(output)
      end

      response
    end
  end
end
