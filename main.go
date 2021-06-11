package main

import (
	"fmt"
	"time"
)

func main() {
	for {
		fmt.Println("Infinite Loop 1")
		time.Sleep(time.Second * 600)
	}
}
