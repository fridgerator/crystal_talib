@[Link("ta_lib")]
@[Link(ldflags: "-lm")]
lib LibTaLib
  FUNC_FLG_OVERLAP = 16777216
  FUNC_FLG_VOLUME = 67108864
  FUNC_FLG_UNST_PER = 134217728
  FUNC_FLG_CANDLESTICK = 268435456
  IN_PRICE_OPEN = 1
  IN_PRICE_HIGH = 2
  IN_PRICE_LOW = 4
  IN_PRICE_CLOSE = 8
  IN_PRICE_VOLUME = 16
  IN_PRICE_OPENINTEREST = 32
  IN_PRICE_TIMESTAMP = 64
  OPTIN_IS_PERCENT = 1048576
  OPTIN_IS_DEGREE = 2097152
  OPTIN_IS_CURRENCY = 4194304
  OPTIN_ADVANCED = 16777216
  OUT_LINE = 1
  OUT_DOT_LINE = 2
  OUT_DASH_LINE = 4
  OUT_DOT = 8
  OUT_HISTO = 16
  OUT_PATTERN_BOOL = 32
  OUT_PATTERN_BULL_BEAR = 64
  OUT_PATTERN_STRENGTH = 128
  OUT_POSITIVE = 256
  OUT_NEGATIVE = 512
  OUT_ZERO = 1024
  OUT_UPPER_LIMIT = 2048
  OUT_LOWER_LIMIT = 4096
  Success = 0_i64
  LibNotInitialize = 1_i64
  BadParam = 2_i64
  AllocErr = 3_i64
  GroupNotFound = 4_i64
  FuncNotFound = 5_i64
  InvalidHandle = 6_i64
  InvalidParamHolder = 7_i64
  InvalidParamHolderType = 8_i64
  InvalidParamFunction = 9_i64
  InputNotAllInitialize = 10_i64
  OutputNotAllInitialize = 11_i64
  OutOfRangeStartIndex = 12_i64
  OutOfRangeEndIndex = 13_i64
  InvalidListType = 14_i64
  BadObject = 15_i64
  NotSupported = 16_i64
  InternalError = 5000_i64
  UnknownErr = 65535_i64
  CompatibilityDefault = 0_i64
  CompatibilityMetastock = 1_i64
  MaTypeSma = 0_i64
  MaTypeEma = 1_i64
  MaTypeWma = 2_i64
  MaTypeDema = 3_i64
  MaTypeTema = 4_i64
  MaTypeTrima = 5_i64
  MaTypeKama = 6_i64
  MaTypeMama = 7_i64
  MaTypeT3 = 8_i64
  FuncUnstAdx = 0_i64
  FuncUnstAdxr = 1_i64
  FuncUnstAtr = 2_i64
  FuncUnstCmo = 3_i64
  FuncUnstDx = 4_i64
  FuncUnstEma = 5_i64
  FuncUnstHtDcperiod = 6_i64
  FuncUnstHtDcphase = 7_i64
  FuncUnstHtPhasor = 8_i64
  FuncUnstHtSine = 9_i64
  FuncUnstHtTrendline = 10_i64
  FuncUnstHtTrendmode = 11_i64
  FuncUnstKama = 12_i64
  FuncUnstMama = 13_i64
  FuncUnstMfi = 14_i64
  FuncUnstMinusDi = 15_i64
  FuncUnstMinusDm = 16_i64
  FuncUnstNatr = 17_i64
  FuncUnstPlusDi = 18_i64
  FuncUnstPlusDm = 19_i64
  FuncUnstRsi = 20_i64
  FuncUnstStochrsi = 21_i64
  FuncUnstT3 = 22_i64
  FuncUnstAll = 23_i64
  FuncUnstNone = -1_i64
  RangeTypeRealBody = 0_i64
  RangeTypeHighLow = 1_i64
  RangeTypeShadows = 2_i64
  BodyLong = 0_i64
  BodyVeryLong = 1_i64
  BodyShort = 2_i64
  BodyDoji = 3_i64
  ShadowLong = 4_i64
  ShadowVeryLong = 5_i64
  ShadowShort = 6_i64
  ShadowVeryShort = 7_i64
  Near = 8_i64
  Far = 9_i64
  Equal = 10_i64
  AllCandleSettings = 11_i64
  fun get_version_string = TA_GetVersionString : LibC::Char*
  fun get_version_major = TA_GetVersionMajor : LibC::Char*
  fun get_version_minor = TA_GetVersionMinor : LibC::Char*
  fun get_version_build = TA_GetVersionBuild : LibC::Char*
  fun get_version_date = TA_GetVersionDate : LibC::Char*
  fun get_version_time = TA_GetVersionTime : LibC::Char*
  struct StringTable
    size : LibC::UInt
    string : LibC::Char**
    hidden_data : Void*
  end
  struct RetCodeInfo
    enum_str : LibC::Char*
    info_str : LibC::Char*
  end
  fun set_ret_code_info = TA_SetRetCodeInfo(the_ret_code : RetCode, ret_code_info : RetCodeInfo*)
  enum RetCode
    Success = 0
    LibNotInitialize = 1
    BadParam = 2
    AllocErr = 3
    GroupNotFound = 4
    FuncNotFound = 5
    InvalidHandle = 6
    InvalidParamHolder = 7
    InvalidParamHolderType = 8
    InvalidParamFunction = 9
    InputNotAllInitialize = 10
    OutputNotAllInitialize = 11
    OutOfRangeStartIndex = 12
    OutOfRangeEndIndex = 13
    InvalidListType = 14
    BadObject = 15
    NotSupported = 16
    InternalError = 5000
    UnknownErr = 65535
  end
  fun initialize = TA_Initialize : RetCode
  fun shutdown = TA_Shutdown : RetCode
  fun group_table_alloc = TA_GroupTableAlloc(table : StringTable**) : RetCode
  fun group_table_free = TA_GroupTableFree(table : StringTable*) : RetCode
  fun func_table_alloc = TA_FuncTableAlloc(group : LibC::Char*, table : StringTable**) : RetCode
  fun func_table_free = TA_FuncTableFree(table : StringTable*) : RetCode
  fun get_func_handle = TA_GetFuncHandle(name : LibC::Char*, handle : FuncHandle**) : RetCode
  alias FuncHandle = LibC::UInt
  struct FuncInfo
    name : LibC::Char*
    group : LibC::Char*
    hint : LibC::Char*
    camel_case_name : LibC::Char*
    flags : FuncFlags
    nb_input : LibC::UInt
    nb_opt_input : LibC::UInt
    nb_output : LibC::UInt
    handle : FuncHandle*
  end
  alias FuncFlags = LibC::Int
  fun get_func_info = TA_GetFuncInfo(handle : FuncHandle*, func_info : FuncInfo**) : RetCode
  fun for_each_func = TA_ForEachFunc(function_to_call : CallForEachFunc, opaque_data : Void*) : RetCode
  alias CallForEachFunc = (FuncInfo*, Void* -> Void)
  struct RealRange
    min : Real
    max : Real
    precision : Integer
    suggested_start : Real
    suggested_end : Real
    suggested_increment : Real
  end
  alias Real = LibC::Double
  alias Integer = LibC::Int
  struct IntegerRange
    min : Integer
    max : Integer
    suggested_start : Integer
    suggested_end : Integer
    suggested_increment : Integer
  end
  struct RealDataPair
    value : Real
    string : LibC::Char*
  end
  struct IntegerDataPair
    value : Integer
    string : LibC::Char*
  end
  struct RealList
    data : RealDataPair*
    nb_element : LibC::UInt
  end
  struct IntegerList
    data : IntegerDataPair*
    nb_element : LibC::UInt
  end
  InputPrice = 0_i64
  InputReal = 1_i64
  InputInteger = 2_i64
  OptInputRealRange = 0_i64
  OptInputRealList = 1_i64
  OptInputIntegerRange = 2_i64
  OptInputIntegerList = 3_i64
  OutputReal = 0_i64
  OutputInteger = 1_i64
  struct InputParameterInfo
    type : InputParameterType
    param_name : LibC::Char*
    flags : InputFlags
  end
  enum InputParameterType
    InputPrice = 0
    InputReal = 1
    InputInteger = 2
  end
  alias InputFlags = LibC::Int
  struct OptInputParameterInfo
    type : OptInputParameterType
    param_name : LibC::Char*
    flags : OptInputFlags
    display_name : LibC::Char*
    data_set : Void*
    default_value : Real
    hint : LibC::Char*
    help_file : LibC::Char*
  end
  enum OptInputParameterType
    OptInputRealRange = 0
    OptInputRealList = 1
    OptInputIntegerRange = 2
    OptInputIntegerList = 3
  end
  alias OptInputFlags = LibC::Int
  struct OutputParameterInfo
    type : OutputParameterType
    param_name : LibC::Char*
    flags : OutputFlags
  end
  enum OutputParameterType
    OutputReal = 0
    OutputInteger = 1
  end
  alias OutputFlags = LibC::Int
  fun get_input_parameter_info = TA_GetInputParameterInfo(handle : FuncHandle*, param_index : LibC::UInt, info : InputParameterInfo**) : RetCode
  fun get_opt_input_parameter_info = TA_GetOptInputParameterInfo(handle : FuncHandle*, param_index : LibC::UInt, info : OptInputParameterInfo**) : RetCode
  fun get_output_parameter_info = TA_GetOutputParameterInfo(handle : FuncHandle*, param_index : LibC::UInt, info : OutputParameterInfo**) : RetCode
  struct ParamHolder
    hidden_data : Void*
  end
  fun param_holder_alloc = TA_ParamHolderAlloc(handle : FuncHandle*, allocated_params : ParamHolder**) : RetCode
  fun param_holder_free = TA_ParamHolderFree(params : ParamHolder*) : RetCode
  fun set_input_param_integer_ptr = TA_SetInputParamIntegerPtr(params : ParamHolder*, param_index : LibC::UInt, value : Integer*) : RetCode
  fun set_input_param_real_ptr = TA_SetInputParamRealPtr(params : ParamHolder*, param_index : LibC::UInt, value : Real*) : RetCode
  fun set_input_param_price_ptr = TA_SetInputParamPricePtr(params : ParamHolder*, param_index : LibC::UInt, open : Real*, high : Real*, low : Real*, close : Real*, volume : Real*, open_interest : Real*) : RetCode
  fun set_opt_input_param_integer = TA_SetOptInputParamInteger(params : ParamHolder*, param_index : LibC::UInt, opt_in_value : Integer) : RetCode
  fun set_opt_input_param_real = TA_SetOptInputParamReal(params : ParamHolder*, param_index : LibC::UInt, opt_in_value : Real) : RetCode
  fun set_output_param_integer_ptr = TA_SetOutputParamIntegerPtr(params : ParamHolder*, param_index : LibC::UInt, out : Integer*) : RetCode
  fun set_output_param_real_ptr = TA_SetOutputParamRealPtr(params : ParamHolder*, param_index : LibC::UInt, out : Real*) : RetCode
  fun get_lookback = TA_GetLookback(params : ParamHolder*, lookback : Integer*) : RetCode
  fun call_func = TA_CallFunc(params : ParamHolder*, start_idx : Integer, end_idx : Integer, out_beg_idx : Integer*, out_nb_element : Integer*) : RetCode
  fun function_description_xml = TA_FunctionDescriptionXML : LibC::Char*
  fun acos = TA_ACOS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_acos = TA_S_ACOS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun acos_lookback = TA_ACOS_Lookback : LibC::Int
  fun ad = TA_AD(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, in_volume : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ad = TA_S_AD(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, in_volume : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ad_lookback = TA_AD_Lookback : LibC::Int
  fun add = TA_ADD(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_add = TA_S_ADD(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun add_lookback = TA_ADD_Lookback : LibC::Int
  fun adosc = TA_ADOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, in_volume : LibC::Double*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_adosc = TA_S_ADOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, in_volume : LibC::Float*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun adosc_lookback = TA_ADOSC_Lookback(opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int) : LibC::Int
  fun adx = TA_ADX(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_adx = TA_S_ADX(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun adx_lookback = TA_ADX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun adxr = TA_ADXR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_adxr = TA_S_ADXR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun adxr_lookback = TA_ADXR_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun apo = TA_APO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  enum MaType
    MaTypeSma = 0
    MaTypeEma = 1
    MaTypeWma = 2
    MaTypeDema = 3
    MaTypeTema = 4
    MaTypeTrima = 5
    MaTypeKama = 6
    MaTypeMama = 7
    MaTypeT3 = 8
  end
  fun s_apo = TA_S_APO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun apo_lookback = TA_APO_Lookback(opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType) : LibC::Int
  fun aroon = TA_AROON(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_aroon_down : LibC::Double*, out_aroon_up : LibC::Double*) : RetCode
  fun s_aroon = TA_S_AROON(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_aroon_down : LibC::Double*, out_aroon_up : LibC::Double*) : RetCode
  fun aroon_lookback = TA_AROON_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun aroonosc = TA_AROONOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_aroonosc = TA_S_AROONOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun aroonosc_lookback = TA_AROONOSC_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun asin = TA_ASIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_asin = TA_S_ASIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun asin_lookback = TA_ASIN_Lookback : LibC::Int
  fun atan = TA_ATAN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_atan = TA_S_ATAN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun atan_lookback = TA_ATAN_Lookback : LibC::Int
  fun atr = TA_ATR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_atr = TA_S_ATR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun atr_lookback = TA_ATR_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun avgprice = TA_AVGPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_avgprice = TA_S_AVGPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun avgprice_lookback = TA_AVGPRICE_Lookback : LibC::Int
  fun bbands = TA_BBANDS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_nb_dev_up : LibC::Double, opt_in_nb_dev_dn : LibC::Double, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real_upper_band : LibC::Double*, out_real_middle_band : LibC::Double*, out_real_lower_band : LibC::Double*) : RetCode
  fun s_bbands = TA_S_BBANDS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_nb_dev_up : LibC::Double, opt_in_nb_dev_dn : LibC::Double, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real_upper_band : LibC::Double*, out_real_middle_band : LibC::Double*, out_real_lower_band : LibC::Double*) : RetCode
  fun bbands_lookback = TA_BBANDS_Lookback(opt_in_time_period : LibC::Int, opt_in_nb_dev_up : LibC::Double, opt_in_nb_dev_dn : LibC::Double, opt_in_ma_type : MaType) : LibC::Int
  fun beta = TA_BETA(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_beta = TA_S_BETA(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun beta_lookback = TA_BETA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun bop = TA_BOP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_bop = TA_S_BOP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun bop_lookback = TA_BOP_Lookback : LibC::Int
  fun cci = TA_CCI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_cci = TA_S_CCI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun cci_lookback = TA_CCI_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun cdl2_crows = TA_CDL2CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl2_crows = TA_S_CDL2CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl2_crows_lookback = TA_CDL2CROWS_Lookback : LibC::Int
  fun cdl3_blackcrows = TA_CDL3BLACKCROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_blackcrows = TA_S_CDL3BLACKCROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_blackcrows_lookback = TA_CDL3BLACKCROWS_Lookback : LibC::Int
  fun cdl3_inside = TA_CDL3INSIDE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_inside = TA_S_CDL3INSIDE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_inside_lookback = TA_CDL3INSIDE_Lookback : LibC::Int
  fun cdl3_linestrike = TA_CDL3LINESTRIKE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_linestrike = TA_S_CDL3LINESTRIKE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_linestrike_lookback = TA_CDL3LINESTRIKE_Lookback : LibC::Int
  fun cdl3_outside = TA_CDL3OUTSIDE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_outside = TA_S_CDL3OUTSIDE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_outside_lookback = TA_CDL3OUTSIDE_Lookback : LibC::Int
  fun cdl3_starsinsouth = TA_CDL3STARSINSOUTH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_starsinsouth = TA_S_CDL3STARSINSOUTH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_starsinsouth_lookback = TA_CDL3STARSINSOUTH_Lookback : LibC::Int
  fun cdl3_whitesoldiers = TA_CDL3WHITESOLDIERS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdl3_whitesoldiers = TA_S_CDL3WHITESOLDIERS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdl3_whitesoldiers_lookback = TA_CDL3WHITESOLDIERS_Lookback : LibC::Int
  fun cdlabandonedbaby = TA_CDLABANDONEDBABY(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlabandonedbaby = TA_S_CDLABANDONEDBABY(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlabandonedbaby_lookback = TA_CDLABANDONEDBABY_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdladvanceblock = TA_CDLADVANCEBLOCK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdladvanceblock = TA_S_CDLADVANCEBLOCK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdladvanceblock_lookback = TA_CDLADVANCEBLOCK_Lookback : LibC::Int
  fun cdlbelthold = TA_CDLBELTHOLD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlbelthold = TA_S_CDLBELTHOLD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlbelthold_lookback = TA_CDLBELTHOLD_Lookback : LibC::Int
  fun cdlbreakaway = TA_CDLBREAKAWAY(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlbreakaway = TA_S_CDLBREAKAWAY(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlbreakaway_lookback = TA_CDLBREAKAWAY_Lookback : LibC::Int
  fun cdlclosingmarubozu = TA_CDLCLOSINGMARUBOZU(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlclosingmarubozu = TA_S_CDLCLOSINGMARUBOZU(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlclosingmarubozu_lookback = TA_CDLCLOSINGMARUBOZU_Lookback : LibC::Int
  fun cdlconcealbabyswall = TA_CDLCONCEALBABYSWALL(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlconcealbabyswall = TA_S_CDLCONCEALBABYSWALL(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlconcealbabyswall_lookback = TA_CDLCONCEALBABYSWALL_Lookback : LibC::Int
  fun cdlcounterattack = TA_CDLCOUNTERATTACK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlcounterattack = TA_S_CDLCOUNTERATTACK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlcounterattack_lookback = TA_CDLCOUNTERATTACK_Lookback : LibC::Int
  fun cdldarkcloudcover = TA_CDLDARKCLOUDCOVER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdldarkcloudcover = TA_S_CDLDARKCLOUDCOVER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdldarkcloudcover_lookback = TA_CDLDARKCLOUDCOVER_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdldoji = TA_CDLDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdldoji = TA_S_CDLDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdldoji_lookback = TA_CDLDOJI_Lookback : LibC::Int
  fun cdldojistar = TA_CDLDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdldojistar = TA_S_CDLDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdldojistar_lookback = TA_CDLDOJISTAR_Lookback : LibC::Int
  fun cdldragonflydoji = TA_CDLDRAGONFLYDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdldragonflydoji = TA_S_CDLDRAGONFLYDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdldragonflydoji_lookback = TA_CDLDRAGONFLYDOJI_Lookback : LibC::Int
  fun cdlengulfing = TA_CDLENGULFING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlengulfing = TA_S_CDLENGULFING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlengulfing_lookback = TA_CDLENGULFING_Lookback : LibC::Int
  fun cdleveningdojistar = TA_CDLEVENINGDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdleveningdojistar = TA_S_CDLEVENINGDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdleveningdojistar_lookback = TA_CDLEVENINGDOJISTAR_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdleveningstar = TA_CDLEVENINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdleveningstar = TA_S_CDLEVENINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdleveningstar_lookback = TA_CDLEVENINGSTAR_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdlgapsidesidewhite = TA_CDLGAPSIDESIDEWHITE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlgapsidesidewhite = TA_S_CDLGAPSIDESIDEWHITE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlgapsidesidewhite_lookback = TA_CDLGAPSIDESIDEWHITE_Lookback : LibC::Int
  fun cdlgravestonedoji = TA_CDLGRAVESTONEDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlgravestonedoji = TA_S_CDLGRAVESTONEDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlgravestonedoji_lookback = TA_CDLGRAVESTONEDOJI_Lookback : LibC::Int
  fun cdlhammer = TA_CDLHAMMER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhammer = TA_S_CDLHAMMER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhammer_lookback = TA_CDLHAMMER_Lookback : LibC::Int
  fun cdlhangingman = TA_CDLHANGINGMAN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhangingman = TA_S_CDLHANGINGMAN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhangingman_lookback = TA_CDLHANGINGMAN_Lookback : LibC::Int
  fun cdlharami = TA_CDLHARAMI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlharami = TA_S_CDLHARAMI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlharami_lookback = TA_CDLHARAMI_Lookback : LibC::Int
  fun cdlharamicross = TA_CDLHARAMICROSS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlharamicross = TA_S_CDLHARAMICROSS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlharamicross_lookback = TA_CDLHARAMICROSS_Lookback : LibC::Int
  fun cdlhighwave = TA_CDLHIGHWAVE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhighwave = TA_S_CDLHIGHWAVE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhighwave_lookback = TA_CDLHIGHWAVE_Lookback : LibC::Int
  fun cdlhikkake = TA_CDLHIKKAKE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhikkake = TA_S_CDLHIKKAKE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhikkake_lookback = TA_CDLHIKKAKE_Lookback : LibC::Int
  fun cdlhikkakemod = TA_CDLHIKKAKEMOD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhikkakemod = TA_S_CDLHIKKAKEMOD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhikkakemod_lookback = TA_CDLHIKKAKEMOD_Lookback : LibC::Int
  fun cdlhomingpigeon = TA_CDLHOMINGPIGEON(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlhomingpigeon = TA_S_CDLHOMINGPIGEON(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlhomingpigeon_lookback = TA_CDLHOMINGPIGEON_Lookback : LibC::Int
  fun cdlidentical3_crows = TA_CDLIDENTICAL3CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlidentical3_crows = TA_S_CDLIDENTICAL3CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlidentical3_crows_lookback = TA_CDLIDENTICAL3CROWS_Lookback : LibC::Int
  fun cdlinneck = TA_CDLINNECK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlinneck = TA_S_CDLINNECK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlinneck_lookback = TA_CDLINNECK_Lookback : LibC::Int
  fun cdlinvertedhammer = TA_CDLINVERTEDHAMMER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlinvertedhammer = TA_S_CDLINVERTEDHAMMER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlinvertedhammer_lookback = TA_CDLINVERTEDHAMMER_Lookback : LibC::Int
  fun cdlkicking = TA_CDLKICKING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlkicking = TA_S_CDLKICKING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlkicking_lookback = TA_CDLKICKING_Lookback : LibC::Int
  fun cdlkickingbylength = TA_CDLKICKINGBYLENGTH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlkickingbylength = TA_S_CDLKICKINGBYLENGTH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlkickingbylength_lookback = TA_CDLKICKINGBYLENGTH_Lookback : LibC::Int
  fun cdlladderbottom = TA_CDLLADDERBOTTOM(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlladderbottom = TA_S_CDLLADDERBOTTOM(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlladderbottom_lookback = TA_CDLLADDERBOTTOM_Lookback : LibC::Int
  fun cdllongleggeddoji = TA_CDLLONGLEGGEDDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdllongleggeddoji = TA_S_CDLLONGLEGGEDDOJI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdllongleggeddoji_lookback = TA_CDLLONGLEGGEDDOJI_Lookback : LibC::Int
  fun cdllongline = TA_CDLLONGLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdllongline = TA_S_CDLLONGLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdllongline_lookback = TA_CDLLONGLINE_Lookback : LibC::Int
  fun cdlmarubozu = TA_CDLMARUBOZU(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlmarubozu = TA_S_CDLMARUBOZU(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlmarubozu_lookback = TA_CDLMARUBOZU_Lookback : LibC::Int
  fun cdlmatchinglow = TA_CDLMATCHINGLOW(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlmatchinglow = TA_S_CDLMATCHINGLOW(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlmatchinglow_lookback = TA_CDLMATCHINGLOW_Lookback : LibC::Int
  fun cdlmathold = TA_CDLMATHOLD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlmathold = TA_S_CDLMATHOLD(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlmathold_lookback = TA_CDLMATHOLD_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdlmorningdojistar = TA_CDLMORNINGDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlmorningdojistar = TA_S_CDLMORNINGDOJISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlmorningdojistar_lookback = TA_CDLMORNINGDOJISTAR_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdlmorningstar = TA_CDLMORNINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlmorningstar = TA_S_CDLMORNINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_penetration : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlmorningstar_lookback = TA_CDLMORNINGSTAR_Lookback(opt_in_penetration : LibC::Double) : LibC::Int
  fun cdlonneck = TA_CDLONNECK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlonneck = TA_S_CDLONNECK(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlonneck_lookback = TA_CDLONNECK_Lookback : LibC::Int
  fun cdlpiercing = TA_CDLPIERCING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlpiercing = TA_S_CDLPIERCING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlpiercing_lookback = TA_CDLPIERCING_Lookback : LibC::Int
  fun cdlrickshawman = TA_CDLRICKSHAWMAN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlrickshawman = TA_S_CDLRICKSHAWMAN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlrickshawman_lookback = TA_CDLRICKSHAWMAN_Lookback : LibC::Int
  fun cdlrisefall3_methods = TA_CDLRISEFALL3METHODS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlrisefall3_methods = TA_S_CDLRISEFALL3METHODS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlrisefall3_methods_lookback = TA_CDLRISEFALL3METHODS_Lookback : LibC::Int
  fun cdlseparatinglines = TA_CDLSEPARATINGLINES(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlseparatinglines = TA_S_CDLSEPARATINGLINES(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlseparatinglines_lookback = TA_CDLSEPARATINGLINES_Lookback : LibC::Int
  fun cdlshootingstar = TA_CDLSHOOTINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlshootingstar = TA_S_CDLSHOOTINGSTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlshootingstar_lookback = TA_CDLSHOOTINGSTAR_Lookback : LibC::Int
  fun cdlshortline = TA_CDLSHORTLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlshortline = TA_S_CDLSHORTLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlshortline_lookback = TA_CDLSHORTLINE_Lookback : LibC::Int
  fun cdlspinningtop = TA_CDLSPINNINGTOP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlspinningtop = TA_S_CDLSPINNINGTOP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlspinningtop_lookback = TA_CDLSPINNINGTOP_Lookback : LibC::Int
  fun cdlstalledpattern = TA_CDLSTALLEDPATTERN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlstalledpattern = TA_S_CDLSTALLEDPATTERN(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlstalledpattern_lookback = TA_CDLSTALLEDPATTERN_Lookback : LibC::Int
  fun cdlsticksandwich = TA_CDLSTICKSANDWICH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlsticksandwich = TA_S_CDLSTICKSANDWICH(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlsticksandwich_lookback = TA_CDLSTICKSANDWICH_Lookback : LibC::Int
  fun cdltakuri = TA_CDLTAKURI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdltakuri = TA_S_CDLTAKURI(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdltakuri_lookback = TA_CDLTAKURI_Lookback : LibC::Int
  fun cdltasukigap = TA_CDLTASUKIGAP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdltasukigap = TA_S_CDLTASUKIGAP(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdltasukigap_lookback = TA_CDLTASUKIGAP_Lookback : LibC::Int
  fun cdlthrusting = TA_CDLTHRUSTING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlthrusting = TA_S_CDLTHRUSTING(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlthrusting_lookback = TA_CDLTHRUSTING_Lookback : LibC::Int
  fun cdltristar = TA_CDLTRISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdltristar = TA_S_CDLTRISTAR(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdltristar_lookback = TA_CDLTRISTAR_Lookback : LibC::Int
  fun cdlunique3_river = TA_CDLUNIQUE3RIVER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlunique3_river = TA_S_CDLUNIQUE3RIVER(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlunique3_river_lookback = TA_CDLUNIQUE3RIVER_Lookback : LibC::Int
  fun cdlupsidegap2_crows = TA_CDLUPSIDEGAP2CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlupsidegap2_crows = TA_S_CDLUPSIDEGAP2CROWS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlupsidegap2_crows_lookback = TA_CDLUPSIDEGAP2CROWS_Lookback : LibC::Int
  fun cdlxsidegap3_methods = TA_CDLXSIDEGAP3METHODS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Double*, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_cdlxsidegap3_methods = TA_S_CDLXSIDEGAP3METHODS(start_idx : LibC::Int, end_idx : LibC::Int, in_open : LibC::Float*, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun cdlxsidegap3_methods_lookback = TA_CDLXSIDEGAP3METHODS_Lookback : LibC::Int
  fun ceil = TA_CEIL(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ceil = TA_S_CEIL(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ceil_lookback = TA_CEIL_Lookback : LibC::Int
  fun cmo = TA_CMO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_cmo = TA_S_CMO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun cmo_lookback = TA_CMO_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun correl = TA_CORREL(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_correl = TA_S_CORREL(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun correl_lookback = TA_CORREL_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun cos = TA_COS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_cos = TA_S_COS(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun cos_lookback = TA_COS_Lookback : LibC::Int
  fun cosh = TA_COSH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_cosh = TA_S_COSH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun cosh_lookback = TA_COSH_Lookback : LibC::Int
  fun dema = TA_DEMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_dema = TA_S_DEMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun dema_lookback = TA_DEMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun div = TA_DIV(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_div = TA_S_DIV(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun div_lookback = TA_DIV_Lookback : LibC::Int
  fun dx = TA_DX(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_dx = TA_S_DX(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun dx_lookback = TA_DX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun ema = TA_EMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ema = TA_S_EMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ema_lookback = TA_EMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun exp = TA_EXP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_exp = TA_S_EXP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun exp_lookback = TA_EXP_Lookback : LibC::Int
  fun floor = TA_FLOOR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_floor = TA_S_FLOOR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun floor_lookback = TA_FLOOR_Lookback : LibC::Int
  fun ht_dcperiod = TA_HT_DCPERIOD(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ht_dcperiod = TA_S_HT_DCPERIOD(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ht_dcperiod_lookback = TA_HT_DCPERIOD_Lookback : LibC::Int
  fun ht_dcphase = TA_HT_DCPHASE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ht_dcphase = TA_S_HT_DCPHASE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ht_dcphase_lookback = TA_HT_DCPHASE_Lookback : LibC::Int
  fun ht_phasor = TA_HT_PHASOR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_in_phase : LibC::Double*, out_quadrature : LibC::Double*) : RetCode
  fun s_ht_phasor = TA_S_HT_PHASOR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_in_phase : LibC::Double*, out_quadrature : LibC::Double*) : RetCode
  fun ht_phasor_lookback = TA_HT_PHASOR_Lookback : LibC::Int
  fun ht_sine = TA_HT_SINE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_sine : LibC::Double*, out_lead_sine : LibC::Double*) : RetCode
  fun s_ht_sine = TA_S_HT_SINE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_sine : LibC::Double*, out_lead_sine : LibC::Double*) : RetCode
  fun ht_sine_lookback = TA_HT_SINE_Lookback : LibC::Int
  fun ht_trendline = TA_HT_TRENDLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ht_trendline = TA_S_HT_TRENDLINE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ht_trendline_lookback = TA_HT_TRENDLINE_Lookback : LibC::Int
  fun ht_trendmode = TA_HT_TRENDMODE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_ht_trendmode = TA_S_HT_TRENDMODE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun ht_trendmode_lookback = TA_HT_TRENDMODE_Lookback : LibC::Int
  fun kama = TA_KAMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_kama = TA_S_KAMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun kama_lookback = TA_KAMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun linearreg = TA_LINEARREG(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_linearreg = TA_S_LINEARREG(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun linearreg_lookback = TA_LINEARREG_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun linearreg_angle = TA_LINEARREG_ANGLE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_linearreg_angle = TA_S_LINEARREG_ANGLE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun linearreg_angle_lookback = TA_LINEARREG_ANGLE_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun linearreg_intercept = TA_LINEARREG_INTERCEPT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_linearreg_intercept = TA_S_LINEARREG_INTERCEPT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun linearreg_intercept_lookback = TA_LINEARREG_INTERCEPT_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun linearreg_slope = TA_LINEARREG_SLOPE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_linearreg_slope = TA_S_LINEARREG_SLOPE(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun linearreg_slope_lookback = TA_LINEARREG_SLOPE_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun ln = TA_LN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ln = TA_S_LN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ln_lookback = TA_LN_Lookback : LibC::Int
  fun log10 = TA_LOG10(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_log10 = TA_S_LOG10(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun log10_lookback = TA_LOG10_Lookback : LibC::Int
  fun ma = TA_MA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ma = TA_S_MA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ma_lookback = TA_MA_Lookback(opt_in_time_period : LibC::Int, opt_in_ma_type : MaType) : LibC::Int
  fun macd = TA_MACD(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_signal_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun s_macd = TA_S_MACD(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_signal_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun macd_lookback = TA_MACD_Lookback(opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_signal_period : LibC::Int) : LibC::Int
  fun macdext = TA_MACDEXT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_fast_period : LibC::Int, opt_in_fast_ma_type : MaType, opt_in_slow_period : LibC::Int, opt_in_slow_ma_type : MaType, opt_in_signal_period : LibC::Int, opt_in_signal_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun s_macdext = TA_S_MACDEXT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_fast_period : LibC::Int, opt_in_fast_ma_type : MaType, opt_in_slow_period : LibC::Int, opt_in_slow_ma_type : MaType, opt_in_signal_period : LibC::Int, opt_in_signal_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun macdext_lookback = TA_MACDEXT_Lookback(opt_in_fast_period : LibC::Int, opt_in_fast_ma_type : MaType, opt_in_slow_period : LibC::Int, opt_in_slow_ma_type : MaType, opt_in_signal_period : LibC::Int, opt_in_signal_ma_type : MaType) : LibC::Int
  fun macdfix = TA_MACDFIX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_signal_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun s_macdfix = TA_S_MACDFIX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_signal_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_macd : LibC::Double*, out_macd_signal : LibC::Double*, out_macd_hist : LibC::Double*) : RetCode
  fun macdfix_lookback = TA_MACDFIX_Lookback(opt_in_signal_period : LibC::Int) : LibC::Int
  fun mama = TA_MAMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_fast_limit : LibC::Double, opt_in_slow_limit : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_mama : LibC::Double*, out_fama : LibC::Double*) : RetCode
  fun s_mama = TA_S_MAMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_fast_limit : LibC::Double, opt_in_slow_limit : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_mama : LibC::Double*, out_fama : LibC::Double*) : RetCode
  fun mama_lookback = TA_MAMA_Lookback(opt_in_fast_limit : LibC::Double, opt_in_slow_limit : LibC::Double) : LibC::Int
  fun mavp = TA_MAVP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, in_periods : LibC::Double*, opt_in_min_period : LibC::Int, opt_in_max_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_mavp = TA_S_MAVP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, in_periods : LibC::Float*, opt_in_min_period : LibC::Int, opt_in_max_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun mavp_lookback = TA_MAVP_Lookback(opt_in_min_period : LibC::Int, opt_in_max_period : LibC::Int, opt_in_ma_type : MaType) : LibC::Int
  fun max = TA_MAX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_max = TA_S_MAX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun max_lookback = TA_MAX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun maxindex = TA_MAXINDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_maxindex = TA_S_MAXINDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun maxindex_lookback = TA_MAXINDEX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun medprice = TA_MEDPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_medprice = TA_S_MEDPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun medprice_lookback = TA_MEDPRICE_Lookback : LibC::Int
  fun mfi = TA_MFI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, in_volume : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_mfi = TA_S_MFI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, in_volume : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun mfi_lookback = TA_MFI_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun midpoint = TA_MIDPOINT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_midpoint = TA_S_MIDPOINT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun midpoint_lookback = TA_MIDPOINT_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun midprice = TA_MIDPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_midprice = TA_S_MIDPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun midprice_lookback = TA_MIDPRICE_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun min = TA_MIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_min = TA_S_MIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun min_lookback = TA_MIN_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun minindex = TA_MININDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun s_minindex = TA_S_MININDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_integer : LibC::Int*) : RetCode
  fun minindex_lookback = TA_MININDEX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun minmax = TA_MINMAX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_min : LibC::Double*, out_max : LibC::Double*) : RetCode
  fun s_minmax = TA_S_MINMAX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_min : LibC::Double*, out_max : LibC::Double*) : RetCode
  fun minmax_lookback = TA_MINMAX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun minmaxindex = TA_MINMAXINDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_min_idx : LibC::Int*, out_max_idx : LibC::Int*) : RetCode
  fun s_minmaxindex = TA_S_MINMAXINDEX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_min_idx : LibC::Int*, out_max_idx : LibC::Int*) : RetCode
  fun minmaxindex_lookback = TA_MINMAXINDEX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun minus_di = TA_MINUS_DI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_minus_di = TA_S_MINUS_DI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun minus_di_lookback = TA_MINUS_DI_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun minus_dm = TA_MINUS_DM(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_minus_dm = TA_S_MINUS_DM(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun minus_dm_lookback = TA_MINUS_DM_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun mom = TA_MOM(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_mom = TA_S_MOM(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun mom_lookback = TA_MOM_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun mult = TA_MULT(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_mult = TA_S_MULT(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun mult_lookback = TA_MULT_Lookback : LibC::Int
  fun natr = TA_NATR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_natr = TA_S_NATR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun natr_lookback = TA_NATR_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun obv = TA_OBV(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, in_volume : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_obv = TA_S_OBV(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, in_volume : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun obv_lookback = TA_OBV_Lookback : LibC::Int
  fun plus_di = TA_PLUS_DI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_plus_di = TA_S_PLUS_DI(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun plus_di_lookback = TA_PLUS_DI_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun plus_dm = TA_PLUS_DM(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_plus_dm = TA_S_PLUS_DM(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun plus_dm_lookback = TA_PLUS_DM_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun ppo = TA_PPO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ppo = TA_S_PPO(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ppo_lookback = TA_PPO_Lookback(opt_in_fast_period : LibC::Int, opt_in_slow_period : LibC::Int, opt_in_ma_type : MaType) : LibC::Int
  fun roc = TA_ROC(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_roc = TA_S_ROC(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun roc_lookback = TA_ROC_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun rocp = TA_ROCP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_rocp = TA_S_ROCP(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun rocp_lookback = TA_ROCP_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun rocr = TA_ROCR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_rocr = TA_S_ROCR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun rocr_lookback = TA_ROCR_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun rocr100 = TA_ROCR100(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_rocr100 = TA_S_ROCR100(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun rocr100_lookback = TA_ROCR100_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun rsi = TA_RSI(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_rsi = TA_S_RSI(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun rsi_lookback = TA_RSI_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun sar = TA_SAR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_acceleration : LibC::Double, opt_in_maximum : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sar = TA_S_SAR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_acceleration : LibC::Double, opt_in_maximum : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sar_lookback = TA_SAR_Lookback(opt_in_acceleration : LibC::Double, opt_in_maximum : LibC::Double) : LibC::Int
  fun sarext = TA_SAREXT(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, opt_in_start_value : LibC::Double, opt_in_offset_on_reverse : LibC::Double, opt_in_acceleration_init_long : LibC::Double, opt_in_acceleration_long : LibC::Double, opt_in_acceleration_max_long : LibC::Double, opt_in_acceleration_init_short : LibC::Double, opt_in_acceleration_short : LibC::Double, opt_in_acceleration_max_short : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sarext = TA_S_SAREXT(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, opt_in_start_value : LibC::Double, opt_in_offset_on_reverse : LibC::Double, opt_in_acceleration_init_long : LibC::Double, opt_in_acceleration_long : LibC::Double, opt_in_acceleration_max_long : LibC::Double, opt_in_acceleration_init_short : LibC::Double, opt_in_acceleration_short : LibC::Double, opt_in_acceleration_max_short : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sarext_lookback = TA_SAREXT_Lookback(opt_in_start_value : LibC::Double, opt_in_offset_on_reverse : LibC::Double, opt_in_acceleration_init_long : LibC::Double, opt_in_acceleration_long : LibC::Double, opt_in_acceleration_max_long : LibC::Double, opt_in_acceleration_init_short : LibC::Double, opt_in_acceleration_short : LibC::Double, opt_in_acceleration_max_short : LibC::Double) : LibC::Int
  fun sin = TA_SIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sin = TA_S_SIN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sin_lookback = TA_SIN_Lookback : LibC::Int
  fun sinh = TA_SINH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sinh = TA_S_SINH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sinh_lookback = TA_SINH_Lookback : LibC::Int
  fun sma = TA_SMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sma = TA_S_SMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sma_lookback = TA_SMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun sqrt = TA_SQRT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sqrt = TA_S_SQRT(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sqrt_lookback = TA_SQRT_Lookback : LibC::Int
  fun stddev = TA_STDDEV(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_stddev = TA_S_STDDEV(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun stddev_lookback = TA_STDDEV_Lookback(opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double) : LibC::Int
  fun stoch = TA_STOCH(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_fast_k_period : LibC::Int, opt_in_slow_k_period : LibC::Int, opt_in_slow_k_ma_type : MaType, opt_in_slow_d_period : LibC::Int, opt_in_slow_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_slow_k : LibC::Double*, out_slow_d : LibC::Double*) : RetCode
  fun s_stoch = TA_S_STOCH(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_fast_k_period : LibC::Int, opt_in_slow_k_period : LibC::Int, opt_in_slow_k_ma_type : MaType, opt_in_slow_d_period : LibC::Int, opt_in_slow_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_slow_k : LibC::Double*, out_slow_d : LibC::Double*) : RetCode
  fun stoch_lookback = TA_STOCH_Lookback(opt_in_fast_k_period : LibC::Int, opt_in_slow_k_period : LibC::Int, opt_in_slow_k_ma_type : MaType, opt_in_slow_d_period : LibC::Int, opt_in_slow_d_ma_type : MaType) : LibC::Int
  fun stochf = TA_STOCHF(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_fast_k : LibC::Double*, out_fast_d : LibC::Double*) : RetCode
  fun s_stochf = TA_S_STOCHF(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_fast_k : LibC::Double*, out_fast_d : LibC::Double*) : RetCode
  fun stochf_lookback = TA_STOCHF_Lookback(opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType) : LibC::Int
  fun stochrsi = TA_STOCHRSI(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_fast_k : LibC::Double*, out_fast_d : LibC::Double*) : RetCode
  fun s_stochrsi = TA_S_STOCHRSI(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_fast_k : LibC::Double*, out_fast_d : LibC::Double*) : RetCode
  fun stochrsi_lookback = TA_STOCHRSI_Lookback(opt_in_time_period : LibC::Int, opt_in_fast_k_period : LibC::Int, opt_in_fast_d_period : LibC::Int, opt_in_fast_d_ma_type : MaType) : LibC::Int
  fun sub = TA_SUB(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Double*, in_real1 : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sub = TA_S_SUB(start_idx : LibC::Int, end_idx : LibC::Int, in_real0 : LibC::Float*, in_real1 : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sub_lookback = TA_SUB_Lookback : LibC::Int
  fun sum = TA_SUM(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_sum = TA_S_SUM(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun sum_lookback = TA_SUM_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun t3 = TA_T3(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_v_factor : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_t3 = TA_S_T3(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_v_factor : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun t3_lookback = TA_T3_Lookback(opt_in_time_period : LibC::Int, opt_in_v_factor : LibC::Double) : LibC::Int
  fun tan = TA_TAN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_tan = TA_S_TAN(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun tan_lookback = TA_TAN_Lookback : LibC::Int
  fun tanh = TA_TANH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_tanh = TA_S_TANH(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun tanh_lookback = TA_TANH_Lookback : LibC::Int
  fun tema = TA_TEMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_tema = TA_S_TEMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun tema_lookback = TA_TEMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun trange = TA_TRANGE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_trange = TA_S_TRANGE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun trange_lookback = TA_TRANGE_Lookback : LibC::Int
  fun trima = TA_TRIMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_trima = TA_S_TRIMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun trima_lookback = TA_TRIMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun trix = TA_TRIX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_trix = TA_S_TRIX(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun trix_lookback = TA_TRIX_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun tsf = TA_TSF(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_tsf = TA_S_TSF(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun tsf_lookback = TA_TSF_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun typprice = TA_TYPPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_typprice = TA_S_TYPPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun typprice_lookback = TA_TYPPRICE_Lookback : LibC::Int
  fun ultosc = TA_ULTOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period1 : LibC::Int, opt_in_time_period2 : LibC::Int, opt_in_time_period3 : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_ultosc = TA_S_ULTOSC(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period1 : LibC::Int, opt_in_time_period2 : LibC::Int, opt_in_time_period3 : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun ultosc_lookback = TA_ULTOSC_Lookback(opt_in_time_period1 : LibC::Int, opt_in_time_period2 : LibC::Int, opt_in_time_period3 : LibC::Int) : LibC::Int
  fun var = TA_VAR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_var = TA_S_VAR(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun var_lookback = TA_VAR_Lookback(opt_in_time_period : LibC::Int, opt_in_nb_dev : LibC::Double) : LibC::Int
  fun wclprice = TA_WCLPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_wclprice = TA_S_WCLPRICE(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun wclprice_lookback = TA_WCLPRICE_Lookback : LibC::Int
  fun willr = TA_WILLR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Double*, in_low : LibC::Double*, in_close : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_willr = TA_S_WILLR(start_idx : LibC::Int, end_idx : LibC::Int, in_high : LibC::Float*, in_low : LibC::Float*, in_close : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun willr_lookback = TA_WILLR_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun wma = TA_WMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Double*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun s_wma = TA_S_WMA(start_idx : LibC::Int, end_idx : LibC::Int, in_real : LibC::Float*, opt_in_time_period : LibC::Int, out_beg_idx : LibC::Int*, out_nb_element : LibC::Int*, out_real : LibC::Double*) : RetCode
  fun wma_lookback = TA_WMA_Lookback(opt_in_time_period : LibC::Int) : LibC::Int
  fun set_unstable_period = TA_SetUnstablePeriod(id : FuncUnstId, unstable_period : LibC::UInt) : RetCode
  enum FuncUnstId
    FuncUnstAdx = 0
    FuncUnstAdxr = 1
    FuncUnstAtr = 2
    FuncUnstCmo = 3
    FuncUnstDx = 4
    FuncUnstEma = 5
    FuncUnstHtDcperiod = 6
    FuncUnstHtDcphase = 7
    FuncUnstHtPhasor = 8
    FuncUnstHtSine = 9
    FuncUnstHtTrendline = 10
    FuncUnstHtTrendmode = 11
    FuncUnstKama = 12
    FuncUnstMama = 13
    FuncUnstMfi = 14
    FuncUnstMinusDi = 15
    FuncUnstMinusDm = 16
    FuncUnstNatr = 17
    FuncUnstPlusDi = 18
    FuncUnstPlusDm = 19
    FuncUnstRsi = 20
    FuncUnstStochrsi = 21
    FuncUnstT3 = 22
    FuncUnstAll = 23
    FuncUnstNone = -1
  end
  fun get_unstable_period = TA_GetUnstablePeriod(id : FuncUnstId) : LibC::UInt
  fun set_compatibility = TA_SetCompatibility(value : Compatibility) : RetCode
  enum Compatibility
    CompatibilityDefault = 0
    CompatibilityMetastock = 1
  end
  fun get_compatibility = TA_GetCompatibility : Compatibility
  fun set_candle_settings = TA_SetCandleSettings(setting_type : CandleSettingType, range_type : RangeType, avg_period : LibC::Int, factor : LibC::Double) : RetCode
  enum CandleSettingType
    BodyLong = 0
    BodyVeryLong = 1
    BodyShort = 2
    BodyDoji = 3
    ShadowLong = 4
    ShadowVeryLong = 5
    ShadowShort = 6
    ShadowVeryShort = 7
    Near = 8
    Far = 9
    Equal = 10
    AllCandleSettings = 11
  end
  enum RangeType
    RangeTypeRealBody = 0
    RangeTypeHighLow = 1
    RangeTypeShadows = 2
  end
  fun restore_candle_default_settings = TA_RestoreCandleDefaultSettings(setting_type : CandleSettingType) : RetCode
end
