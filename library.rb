require 'ffi'

module TaLibFFI::Library
  extend FFI::Library
  ffi_lib TaLibFFI.library_path

  TA_REAL_MIN = -3e+37

  TA_REAL_MAX = 3e+37

  TA_REAL_DEFAULT = -4e+37

  TA_RetCode = enum [
    :TA_SUCCES,
    :TA_LIB_NOT_INITIALIZE,
    :TA_BAD_PARAM,
    :TA_ALLOC_ERR,
    :TA_GROUP_NOT_FOUND,
    :TA_FUNC_NOT_FOUND,
    :TA_INVALID_HANDLE,
    :TA_INVALID_PARAM_HOLDER,
    :TA_INVALID_PARAM_HOLDER_TYPE,
    :TA_INVALID_PARAM_FUNCTION,
    :TA_INPUT_NOT_ALL_INITIALIZE,
    :TA_OUTPUT_NOT_ALL_INITIALIZE,
    :TA_OUT_OF_RANGE_START_INDEX,
    :TA_OUT_OF_RANGE_END_INDEX,
    :TA_INVALID_LIST_TYPE,
    :TA_BAD_OBJECT,
    :TA_NOT_SUPPORTED,
    :TA_INTERNAL_ERROR, 5000,
    :TA_UNKNOWN_ERR, 0xFFFF,
  ]

  TA_Compatibility = enum [
    :TA_COMPATIBILITY_DEFAULT,
    :TA_COMPATIBILITY_METASTOCK,
  ]

  TA_MAType = enum [
    :TA_MAType_SMA, 0,
    :TA_MAType_EMA, 1,
    :TA_MAType_WMA, 2,
    :TA_MAType_DEMA, 3,
    :TA_MAType_TEMA, 4,
    :TA_MAType_TRIMA, 5,
    :TA_MAType_KAMA, 6,
    :TA_MAType_MAMA, 7,
    :TA_MAType_T3, 8,
  ]

  TA_FuncUnstId = enum [
    :TA_FUNC_UNST_ADX,
    :TA_FUNC_UNST_ADXR,
    :TA_FUNC_UNST_ATR,
    :TA_FUNC_UNST_CMO,
    :TA_FUNC_UNST_DX,
    :TA_FUNC_UNST_EMA,
    :TA_FUNC_UNST_HT_DCPERIOD,
    :TA_FUNC_UNST_HT_DCPHASE,
    :TA_FUNC_UNST_HT_PHASOR,
    :TA_FUNC_UNST_HT_SINE,
    :TA_FUNC_UNST_HT_TRENDLINE,
    :TA_FUNC_UNST_HT_TRENDMODE,
    :TA_FUNC_UNST_KAMA,
    :TA_FUNC_UNST_MAMA,
    :TA_FUNC_UNST_MFI,
    :TA_FUNC_UNST_MINUS_DI,
    :TA_FUNC_UNST_MINUS_DM,
    :TA_FUNC_UNST_NATR,
    :TA_FUNC_UNST_PLUS_DI,
    :TA_FUNC_UNST_PLUS_DM,
    :TA_FUNC_UNST_RSI,
    :TA_FUNC_UNST_STOCHRSI,
    :TA_FUNC_UNST_T3,
    :TA_FUNC_UNST_ALL,
    :TA_FUNC_UNST_NONE, -1,
  ]

  TA_RangeType = enum [
    :TA_RangeType_RealBody,
    :TA_RangeType_HighLow,
    :TA_RangeType_Shadows,
  ]

  TA_CandleSettingType = enum [
    :TA_BodyLong,
    :TA_BodyVeryLong,
    :TA_BodyShort,
    :TA_BodyDoji,
    :TA_ShadowLong,
    :TA_ShadowVeryLong,
    :TA_ShadowShort,
    :TA_ShadowVeryShort,
    :TA_Near,
    :TA_Far,
    :TA_Equal,
    :TA_AllCandleSettings,
  ]

  attach_function :TA_GetVersionString, [], :string

  attach_function :TA_GetVersionMajor, [], :string

  attach_function :TA_GetVersionMinor, [], :string

  attach_function :TA_GetVersionBuild, [], :string

  attach_function :TA_GetVersionDate, [], :string

  attach_function :TA_GetVersionTime, [], :string

  class TA_StringTable < FFI::Struct
    layout :size, :uint,
           :string, :pointer,
           :hiddenData, :pointer
  end

  class TA_RetCodeInfo < FFI::Struct
    layout :enumStr, :string,
           :infoStr, :string
  end

  attach_function :TA_SetRetCodeInfo, [TA_RetCode, :pointer], :void

  attach_function :TA_Initialize, [], TA_RetCode

  attach_function :TA_Shutdown, [], TA_RetCode

  attach_function :TA_ACOS, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ACOS, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ACOS_Lookback, [], :int

  attach_function :TA_AD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_AD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_AD_Lookback, [], :int

  attach_function :TA_ADD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ADD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ADD_Lookback, [], :int

  attach_function :TA_ADOSC, [:int, :int, :pointer, :pointer, :pointer, :pointer, :int, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ADOSC, [:int, :int, :pointer, :pointer, :pointer, :pointer, :int, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ADOSC_Lookback, [:int, :int], :int

  attach_function :TA_ADX, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ADX, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ADX_Lookback, [:int], :int

  attach_function :TA_ADXR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ADXR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ADXR_Lookback, [:int], :int

  attach_function :TA_APO, [:int, :int, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_APO, [:int, :int, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_APO_Lookback, [:int, :int, TA_MAType], :int

  attach_function :TA_AROON, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_AROON, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_AROON_Lookback, [:int], :int

  attach_function :TA_AROONOSC, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_AROONOSC, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_AROONOSC_Lookback, [:int], :int

  attach_function :TA_ASIN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ASIN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ASIN_Lookback, [], :int

  attach_function :TA_ATAN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ATAN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ATAN_Lookback, [], :int

  attach_function :TA_ATR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ATR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ATR_Lookback, [:int], :int

  attach_function :TA_AVGPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_AVGPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_AVGPRICE_Lookback, [], :int

  attach_function :TA_BBANDS, [:int, :int, :pointer, :int, :double, :double, TA_MAType, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_BBANDS, [:int, :int, :pointer, :int, :double, :double, TA_MAType, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_BBANDS_Lookback, [:int, :double, :double, TA_MAType], :int

  attach_function :TA_BETA, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_BETA, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_BETA_Lookback, [:int], :int

  attach_function :TA_BOP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_BOP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_BOP_Lookback, [], :int

  attach_function :TA_CCI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CCI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CCI_Lookback, [:int], :int

  attach_function :TA_CDL2CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL2CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL2CROWS_Lookback, [], :int

  attach_function :TA_CDL3BLACKCROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3BLACKCROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3BLACKCROWS_Lookback, [], :int

  attach_function :TA_CDL3INSIDE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3INSIDE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3INSIDE_Lookback, [], :int

  attach_function :TA_CDL3LINESTRIKE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3LINESTRIKE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3LINESTRIKE_Lookback, [], :int

  attach_function :TA_CDL3OUTSIDE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3OUTSIDE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3OUTSIDE_Lookback, [], :int

  attach_function :TA_CDL3STARSINSOUTH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3STARSINSOUTH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3STARSINSOUTH_Lookback, [], :int

  attach_function :TA_CDL3WHITESOLDIERS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDL3WHITESOLDIERS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDL3WHITESOLDIERS_Lookback, [], :int

  attach_function :TA_CDLABANDONEDBABY, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLABANDONEDBABY, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLABANDONEDBABY_Lookback, [:double], :int

  attach_function :TA_CDLADVANCEBLOCK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLADVANCEBLOCK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLADVANCEBLOCK_Lookback, [], :int

  attach_function :TA_CDLBELTHOLD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLBELTHOLD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLBELTHOLD_Lookback, [], :int

  attach_function :TA_CDLBREAKAWAY, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLBREAKAWAY, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLBREAKAWAY_Lookback, [], :int

  attach_function :TA_CDLCLOSINGMARUBOZU, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLCLOSINGMARUBOZU, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLCLOSINGMARUBOZU_Lookback, [], :int

  attach_function :TA_CDLCONCEALBABYSWALL, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLCONCEALBABYSWALL, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLCONCEALBABYSWALL_Lookback, [], :int

  attach_function :TA_CDLCOUNTERATTACK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLCOUNTERATTACK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLCOUNTERATTACK_Lookback, [], :int

  attach_function :TA_CDLDARKCLOUDCOVER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLDARKCLOUDCOVER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLDARKCLOUDCOVER_Lookback, [:double], :int

  attach_function :TA_CDLDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLDOJI_Lookback, [], :int

  attach_function :TA_CDLDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLDOJISTAR_Lookback, [], :int

  attach_function :TA_CDLDRAGONFLYDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLDRAGONFLYDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLDRAGONFLYDOJI_Lookback, [], :int

  attach_function :TA_CDLENGULFING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLENGULFING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLENGULFING_Lookback, [], :int

  attach_function :TA_CDLEVENINGDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLEVENINGDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLEVENINGDOJISTAR_Lookback, [:double], :int

  attach_function :TA_CDLEVENINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLEVENINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLEVENINGSTAR_Lookback, [:double], :int

  attach_function :TA_CDLGAPSIDESIDEWHITE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLGAPSIDESIDEWHITE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLGAPSIDESIDEWHITE_Lookback, [], :int

  attach_function :TA_CDLGRAVESTONEDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLGRAVESTONEDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLGRAVESTONEDOJI_Lookback, [], :int

  attach_function :TA_CDLHAMMER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHAMMER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHAMMER_Lookback, [], :int

  attach_function :TA_CDLHANGINGMAN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHANGINGMAN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHANGINGMAN_Lookback, [], :int

  attach_function :TA_CDLHARAMI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHARAMI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHARAMI_Lookback, [], :int

  attach_function :TA_CDLHARAMICROSS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHARAMICROSS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHARAMICROSS_Lookback, [], :int

  attach_function :TA_CDLHIGHWAVE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHIGHWAVE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHIGHWAVE_Lookback, [], :int

  attach_function :TA_CDLHIKKAKE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHIKKAKE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHIKKAKE_Lookback, [], :int

  attach_function :TA_CDLHIKKAKEMOD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHIKKAKEMOD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHIKKAKEMOD_Lookback, [], :int

  attach_function :TA_CDLHOMINGPIGEON, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLHOMINGPIGEON, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLHOMINGPIGEON_Lookback, [], :int

  attach_function :TA_CDLIDENTICAL3CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLIDENTICAL3CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLIDENTICAL3CROWS_Lookback, [], :int

  attach_function :TA_CDLINNECK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLINNECK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLINNECK_Lookback, [], :int

  attach_function :TA_CDLINVERTEDHAMMER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLINVERTEDHAMMER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLINVERTEDHAMMER_Lookback, [], :int

  attach_function :TA_CDLKICKING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLKICKING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLKICKING_Lookback, [], :int

  attach_function :TA_CDLKICKINGBYLENGTH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLKICKINGBYLENGTH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLKICKINGBYLENGTH_Lookback, [], :int

  attach_function :TA_CDLLADDERBOTTOM, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLLADDERBOTTOM, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLLADDERBOTTOM_Lookback, [], :int

  attach_function :TA_CDLLONGLEGGEDDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLLONGLEGGEDDOJI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLLONGLEGGEDDOJI_Lookback, [], :int

  attach_function :TA_CDLLONGLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLLONGLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLLONGLINE_Lookback, [], :int

  attach_function :TA_CDLMARUBOZU, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLMARUBOZU, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLMARUBOZU_Lookback, [], :int

  attach_function :TA_CDLMATCHINGLOW, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLMATCHINGLOW, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLMATCHINGLOW_Lookback, [], :int

  attach_function :TA_CDLMATHOLD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLMATHOLD, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLMATHOLD_Lookback, [:double], :int

  attach_function :TA_CDLMORNINGDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLMORNINGDOJISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLMORNINGDOJISTAR_Lookback, [:double], :int

  attach_function :TA_CDLMORNINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLMORNINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLMORNINGSTAR_Lookback, [:double], :int

  attach_function :TA_CDLONNECK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLONNECK, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLONNECK_Lookback, [], :int

  attach_function :TA_CDLPIERCING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLPIERCING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLPIERCING_Lookback, [], :int

  attach_function :TA_CDLRICKSHAWMAN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLRICKSHAWMAN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLRICKSHAWMAN_Lookback, [], :int

  attach_function :TA_CDLRISEFALL3METHODS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLRISEFALL3METHODS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLRISEFALL3METHODS_Lookback, [], :int

  attach_function :TA_CDLSEPARATINGLINES, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSEPARATINGLINES, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSEPARATINGLINES_Lookback, [], :int

  attach_function :TA_CDLSHOOTINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSHOOTINGSTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSHOOTINGSTAR_Lookback, [], :int

  attach_function :TA_CDLSHORTLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSHORTLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSHORTLINE_Lookback, [], :int

  attach_function :TA_CDLSPINNINGTOP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSPINNINGTOP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSPINNINGTOP_Lookback, [], :int

  attach_function :TA_CDLSTALLEDPATTERN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSTALLEDPATTERN, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSTALLEDPATTERN_Lookback, [], :int

  attach_function :TA_CDLSTICKSANDWICH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLSTICKSANDWICH, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLSTICKSANDWICH_Lookback, [], :int

  attach_function :TA_CDLTAKURI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLTAKURI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLTAKURI_Lookback, [], :int

  attach_function :TA_CDLTASUKIGAP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLTASUKIGAP, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLTASUKIGAP_Lookback, [], :int

  attach_function :TA_CDLTHRUSTING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLTHRUSTING, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLTHRUSTING_Lookback, [], :int

  attach_function :TA_CDLTRISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLTRISTAR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLTRISTAR_Lookback, [], :int

  attach_function :TA_CDLUNIQUE3RIVER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLUNIQUE3RIVER, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLUNIQUE3RIVER_Lookback, [], :int

  attach_function :TA_CDLUPSIDEGAP2CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLUPSIDEGAP2CROWS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLUPSIDEGAP2CROWS_Lookback, [], :int

  attach_function :TA_CDLXSIDEGAP3METHODS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CDLXSIDEGAP3METHODS, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CDLXSIDEGAP3METHODS_Lookback, [], :int

  attach_function :TA_CEIL, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CEIL, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CEIL_Lookback, [], :int

  attach_function :TA_CMO, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CMO, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CMO_Lookback, [:int], :int

  attach_function :TA_CORREL, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_CORREL, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_CORREL_Lookback, [:int], :int

  attach_function :TA_COS, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_COS, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_COS_Lookback, [], :int

  attach_function :TA_COSH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_COSH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_COSH_Lookback, [], :int

  attach_function :TA_DEMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_DEMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_DEMA_Lookback, [:int], :int

  attach_function :TA_DIV, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_DIV, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_DIV_Lookback, [], :int

  attach_function :TA_DX, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_DX, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_DX_Lookback, [:int], :int

  attach_function :TA_EMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_EMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_EMA_Lookback, [:int], :int

  attach_function :TA_EXP, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_EXP, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_EXP_Lookback, [], :int

  attach_function :TA_FLOOR, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_FLOOR, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_FLOOR_Lookback, [], :int

  attach_function :TA_HT_DCPERIOD, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_DCPERIOD, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_DCPERIOD_Lookback, [], :int

  attach_function :TA_HT_DCPHASE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_DCPHASE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_DCPHASE_Lookback, [], :int

  attach_function :TA_HT_PHASOR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_PHASOR, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_PHASOR_Lookback, [], :int

  attach_function :TA_HT_SINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_SINE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_SINE_Lookback, [], :int

  attach_function :TA_HT_TRENDLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_TRENDLINE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_TRENDLINE_Lookback, [], :int

  attach_function :TA_HT_TRENDMODE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_HT_TRENDMODE, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_HT_TRENDMODE_Lookback, [], :int

  attach_function :TA_KAMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_KAMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_KAMA_Lookback, [:int], :int

  attach_function :TA_LINEARREG, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LINEARREG, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LINEARREG_Lookback, [:int], :int

  attach_function :TA_LINEARREG_ANGLE, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LINEARREG_ANGLE, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LINEARREG_ANGLE_Lookback, [:int], :int

  attach_function :TA_LINEARREG_INTERCEPT, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LINEARREG_INTERCEPT, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LINEARREG_INTERCEPT_Lookback, [:int], :int

  attach_function :TA_LINEARREG_SLOPE, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LINEARREG_SLOPE, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LINEARREG_SLOPE_Lookback, [:int], :int

  attach_function :TA_LN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LN_Lookback, [], :int

  attach_function :TA_LOG10, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_LOG10, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_LOG10_Lookback, [], :int

  attach_function :TA_MA, [:int, :int, :pointer, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MA, [:int, :int, :pointer, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MA_Lookback, [:int, TA_MAType], :int

  attach_function :TA_MACD, [:int, :int, :pointer, :int, :int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MACD, [:int, :int, :pointer, :int, :int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MACD_Lookback, [:int, :int, :int], :int

  attach_function :TA_MACDEXT, [:int, :int, :pointer, :int, TA_MAType, :int, TA_MAType, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MACDEXT, [:int, :int, :pointer, :int, TA_MAType, :int, TA_MAType, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MACDEXT_Lookback, [:int, TA_MAType, :int, TA_MAType, :int, TA_MAType], :int

  attach_function :TA_MACDFIX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MACDFIX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MACDFIX_Lookback, [:int], :int

  attach_function :TA_MAMA, [:int, :int, :pointer, :double, :double, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MAMA, [:int, :int, :pointer, :double, :double, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MAMA_Lookback, [:double, :double], :int

  attach_function :TA_MAVP, [:int, :int, :pointer, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MAVP, [:int, :int, :pointer, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MAVP_Lookback, [:int, :int, TA_MAType], :int

  attach_function :TA_MAX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MAX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MAX_Lookback, [:int], :int

  attach_function :TA_MAXINDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MAXINDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MAXINDEX_Lookback, [:int], :int

  attach_function :TA_MEDPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MEDPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MEDPRICE_Lookback, [], :int

  attach_function :TA_MFI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MFI, [:int, :int, :pointer, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MFI_Lookback, [:int], :int

  attach_function :TA_MIDPOINT, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MIDPOINT, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MIDPOINT_Lookback, [:int], :int

  attach_function :TA_MIDPRICE, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MIDPRICE, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MIDPRICE_Lookback, [:int], :int

  attach_function :TA_MIN, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MIN, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MIN_Lookback, [:int], :int

  attach_function :TA_MININDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MININDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MININDEX_Lookback, [:int], :int

  attach_function :TA_MINMAX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MINMAX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MINMAX_Lookback, [:int], :int

  attach_function :TA_MINMAXINDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MINMAXINDEX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MINMAXINDEX_Lookback, [:int], :int

  attach_function :TA_MINUS_DI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MINUS_DI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MINUS_DI_Lookback, [:int], :int

  attach_function :TA_MINUS_DM, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MINUS_DM, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MINUS_DM_Lookback, [:int], :int

  attach_function :TA_MOM, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MOM, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MOM_Lookback, [:int], :int

  attach_function :TA_MULT, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_MULT, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_MULT_Lookback, [], :int

  attach_function :TA_NATR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_NATR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_NATR_Lookback, [:int], :int

  attach_function :TA_OBV, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_OBV, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_OBV_Lookback, [], :int

  attach_function :TA_PLUS_DI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_PLUS_DI, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_PLUS_DI_Lookback, [:int], :int

  attach_function :TA_PLUS_DM, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_PLUS_DM, [:int, :int, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_PLUS_DM_Lookback, [:int], :int

  attach_function :TA_PPO, [:int, :int, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_PPO, [:int, :int, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_PPO_Lookback, [:int, :int, TA_MAType], :int

  attach_function :TA_ROC, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ROC, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ROC_Lookback, [:int], :int

  attach_function :TA_ROCP, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ROCP, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ROCP_Lookback, [:int], :int

  attach_function :TA_ROCR, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ROCR, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ROCR_Lookback, [:int], :int

  attach_function :TA_ROCR100, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ROCR100, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ROCR100_Lookback, [:int], :int

  attach_function :TA_RSI, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_RSI, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_RSI_Lookback, [:int], :int

  attach_function :TA_SAR, [:int, :int, :pointer, :pointer, :double, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SAR, [:int, :int, :pointer, :pointer, :double, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SAR_Lookback, [:double, :double], :int

  attach_function :TA_SAREXT, [:int, :int, :pointer, :pointer, :double, :double, :double, :double, :double, :double, :double, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SAREXT, [:int, :int, :pointer, :pointer, :double, :double, :double, :double, :double, :double, :double, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SAREXT_Lookback, [:double, :double, :double, :double, :double, :double, :double, :double], :int

  attach_function :TA_SIN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SIN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SIN_Lookback, [], :int

  attach_function :TA_SINH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SINH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SINH_Lookback, [], :int

  attach_function :TA_SMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SMA_Lookback, [:int], :int

  attach_function :TA_SQRT, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SQRT, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SQRT_Lookback, [], :int

  attach_function :TA_STDDEV, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_STDDEV, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_STDDEV_Lookback, [:int, :double], :int

  attach_function :TA_STOCH, [:int, :int, :pointer, :pointer, :pointer, :int, :int, TA_MAType, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_STOCH, [:int, :int, :pointer, :pointer, :pointer, :int, :int, TA_MAType, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_STOCH_Lookback, [:int, :int, TA_MAType, :int, TA_MAType], :int

  attach_function :TA_STOCHF, [:int, :int, :pointer, :pointer, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_STOCHF, [:int, :int, :pointer, :pointer, :pointer, :int, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_STOCHF_Lookback, [:int, :int, TA_MAType], :int

  attach_function :TA_STOCHRSI, [:int, :int, :pointer, :int, :int, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_STOCHRSI, [:int, :int, :pointer, :int, :int, :int, TA_MAType, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_STOCHRSI_Lookback, [:int, :int, :int, TA_MAType], :int

  attach_function :TA_SUB, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SUB, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SUB_Lookback, [], :int

  attach_function :TA_SUM, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_SUM, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_SUM_Lookback, [:int], :int

  attach_function :TA_T3, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_T3, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_T3_Lookback, [:int, :double], :int

  attach_function :TA_TAN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TAN, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TAN_Lookback, [], :int

  attach_function :TA_TANH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TANH, [:int, :int, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TANH_Lookback, [], :int

  attach_function :TA_TEMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TEMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TEMA_Lookback, [:int], :int

  attach_function :TA_TRANGE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TRANGE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TRANGE_Lookback, [], :int

  attach_function :TA_TRIMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TRIMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TRIMA_Lookback, [:int], :int

  attach_function :TA_TRIX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TRIX, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TRIX_Lookback, [:int], :int

  attach_function :TA_TSF, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TSF, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TSF_Lookback, [:int], :int

  attach_function :TA_TYPPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_TYPPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_TYPPRICE_Lookback, [], :int

  attach_function :TA_ULTOSC, [:int, :int, :pointer, :pointer, :pointer, :int, :int, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_ULTOSC, [:int, :int, :pointer, :pointer, :pointer, :int, :int, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_ULTOSC_Lookback, [:int, :int, :int], :int

  attach_function :TA_VAR, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_VAR, [:int, :int, :pointer, :int, :double, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_VAR_Lookback, [:int, :double], :int

  attach_function :TA_WCLPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_WCLPRICE, [:int, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_WCLPRICE_Lookback, [], :int

  attach_function :TA_WILLR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_WILLR, [:int, :int, :pointer, :pointer, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_WILLR_Lookback, [:int], :int

  attach_function :TA_WMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_S_WMA, [:int, :int, :pointer, :int, :pointer, :pointer, :pointer], TA_RetCode

  attach_function :TA_WMA_Lookback, [:int], :int

  attach_function :TA_SetUnstablePeriod, [TA_FuncUnstId, :uint], TA_RetCode

  attach_function :TA_GetUnstablePeriod, [TA_FuncUnstId], :uint

  attach_function :TA_SetCompatibility, [TA_Compatibility], TA_RetCode

  attach_function :TA_GetCompatibility, [], TA_Compatibility

  attach_function :TA_SetCandleSettings, [TA_CandleSettingType, TA_RangeType, :int, :double], TA_RetCode

  attach_function :TA_RestoreCandleDefaultSettings, [TA_CandleSettingType], TA_RetCode
end
