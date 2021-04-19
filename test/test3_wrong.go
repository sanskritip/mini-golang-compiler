//Catches syntax error in line 9 column 15 - Missing ;
package main

import "fmt"

func main() {
	var sum int = 0
	var i int ;
	for i = 0  i < 10; i++ {
		sum++;};
}
