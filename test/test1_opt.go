package main
import "fmt"
func main() {
	// This is a comment and it is ignored in symbol table.
	var b int;
	var p int;
	var q int;
	var r int;
	var t int;
	var deadCode int;
	//var a,b int = 2,3 
    var a int = 7+8*2;
	a++;
	var c float32 = 2.3;
	//var d string = "Hello";
	p = a + c;
	q = b;
	t = 5;
	deadCode = q * 3;
	//Constant comparision using relational
	var e bool = 2==3;
	//Copy Prop for q and Const Prop for t
	r = q * t;
	//Identifier comparision using relational
	var f bool = a<b;
	deadCode = q * 3;

	

}
