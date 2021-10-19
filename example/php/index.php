<?php

echo("Greetings from PHP\n");

$ffi = FFI::cdef("void DoQuery();", __DIR__ . "/libquery.so");

$ffi->DoQuery();