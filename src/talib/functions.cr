module CrystalTalib
  module Functions
    def functions
      funcs = Array(String).new
      ret_code = LibTaLib.group_table_alloc(out group_table)
      if ret_code != LibTaLib::RetCode::Success
        raise Exception.new("group_table_alloc failed: #{ret_code}")
      end

      (0..group_table.value.size - 1).each do |i|
        ret_code = LibTaLib.func_table_alloc(group_table.value.string[i], out func_table)
        if ret_code != LibTaLib::RetCode::Success
          raise Exception.new("func_table_alloc failed: #{ret_code}")
        end

        (0..func_table.value.size - 1).each do |x|
          funcs.push String.new(func_table.value.string[x])
        end

        LibTaLib.func_table_free(func_table)
      end

      LibTaLib.group_table_free(group_table)

      return funcs
    end
  end
end
