package main
import "fmt"
func main() {
	// This is a comment and it is ignored in symbol table.
	var b int;
    var a int = 7+8*2;
	a++;
	var c float32 = 2.3;
	var d string = "Hello";
	b = a+c;
	//Constant comparision using relational
	var e bool = 2==3;
	//Identifier comparision using relational
}
