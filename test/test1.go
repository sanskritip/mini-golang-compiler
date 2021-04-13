package main
import "fmt"
func main() {
	// This is a comment and it is ignored in symbol table.
	var b int;
    var a int = 7+8*2;
	a++;
	var c int = 2.3;
	var d string = "Hello";
	var e bool = true;
	b = 3;
	fmt.Println("Hello, world.");
}
