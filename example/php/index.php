<?php

echo("Greetings from php\n");

$ffi = FFI::cdef("void DoQuery();", __DIR__ . "/doQuery.so");

$ffi->DoQuery();