package main
import "fmt"
func main() {
	//Identifier definition
	var a int = 2;

	//Identifier redeclaration -> Semantic error
	var a string = "Hello";

	//Identifier initialised without declartion -> Semantic error
	b=3;

	//Type mismatch in declaration
	var c int = "Not an Int"

	//Type mismatch in initialisation
	a = 2.5
}