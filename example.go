package main

// #include <lib/libquery.h>
// #cgo LDFLAGS: -L${SRCDIR}/lib -lquery
import "C"
import (
	"fmt"
)

func main() {
	fmt.Print("Grettings from Golang\n")
	C.DoQuery()
}