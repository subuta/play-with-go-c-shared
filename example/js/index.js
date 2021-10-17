// Node.js Example
var ref = require("ref");
var ffi = require("ffi");

var lib = ffi.Library("./doQuery.so", {
    DoQuery: ["void", []]
});

console.log("Greetings from Node.js")
lib.DoQuery()