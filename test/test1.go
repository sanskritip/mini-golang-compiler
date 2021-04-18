package main
import "fmt"
func main() {
    // This is a comment and it is ignored in symbol table.
    var b int;
        //Arithmetic Expression +  Assignment
        var a int = 7+8*2;
    a++;
    var c int = 2;
        //String Assignment
    var d string = "Hello";
    b = a+c*2;
        //Comparing Identifier using relational operators
    var e bool = a==b;
        //Comparing Constants using relational operators
        var f bool = 2<3;
}