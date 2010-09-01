require 'rubygems'
require 'ffi'
module TaLibFFI
  require 'extensions'
  require 'library'
  include TaLibFFI::Library
  extend self
end

