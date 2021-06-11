package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Let's go sleep.")
	for {
		fmt.Println("Still sleepy...")
		time.Sleep(time.Second * 600)
	}
}
