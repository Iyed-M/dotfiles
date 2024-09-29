package main

import (
	"fmt"
	"log"
	"os"
)

func main() {
	fmt.Fprint(os.Stderr, "This is a Lua script, not")
	log.Fatal("SHIT>>>")
}
