// Node.js Example
var ref = require("ref");
var ffi = require("ffi");

var lib = ffi.Library("./libquery.so", {
    DoQuery: ["void", []]
});

console.log("Greetings from Node.js")
lib.DoQuery()