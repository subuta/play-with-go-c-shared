require 'ffi'

module Lib
  extend FFI::Library

  ffi_lib './libquery.so'

  attach_function :DoQuery, [], :void
end

puts "Greetings from Ruby\n"
Lib.DoQuery()