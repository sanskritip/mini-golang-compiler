package main
import "fmt"
func main() {
	// This is a comment and it is ignored in symbol table.
	var b int;
    var a int = 7+8*2;
	var c,d int = 2
	a++;
	fmt.Println("Hello, world.",a);
}
