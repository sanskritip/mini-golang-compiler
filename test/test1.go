package main
import "fmt"
var a int = 5;
func main() {
	// This is a comment and it is ignored in symbol table.
	var b int;
    var a int = 7+8*2;
	a++;
	fmt.Println("Hello, world.",a);
}
