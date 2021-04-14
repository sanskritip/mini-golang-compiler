//Catches syntax error of unmatched brackets in line 4
package main
import "fmt"
func main({
	// This is a comment and it is ignored in symbol table.
    var a int = 7+8*2;
	a++;
	//fmt.Println("Hello, world.",a)
}