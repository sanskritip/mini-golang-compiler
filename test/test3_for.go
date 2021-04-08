package main

import "fmt"

func main() {
	var sum int = 0
	for i = 0 ; i < 10; i++ {
		sum = sum + i
	};
	for ; i < 0 ; {
		i = i - 1
	}
	fmt.Println(sum)
}

