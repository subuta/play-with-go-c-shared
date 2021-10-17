require 'ffi'

module Lib
  extend FFI::Library

  ffi_lib './doQuery.so'

  attach_function :DoQuery, [], :void
end

puts "Greetings from Ruby\n"
Lib.DoQuery()