$:.unshift(File.dirname(__FILE__))
require 'talib_ffi'

class TaLib
  include TaLibFFI

  def initialize
    Library.TA_Initialize
  end

  def ma(data, window = 30, ma_type = 0)
    out_beg = FFI::MemoryPointer.new(:int)
    out_nb_el = FFI::MemoryPointer.new(:int)
    in_array = FFI::MemoryPointer.new(:double, data.size)
    in_array.put_array_of_double(0,data.map{|i|i.to_f})

    out_array = FFI::MemoryPointer.new(:double, data.size)
    Library.TA_MA(0, data.size-1, in_array, window, ma_type, out_beg, out_nb_el, out_array)
    out_array.get_array_of_double(0, out_nb_el.get_int(0))
  end
end
