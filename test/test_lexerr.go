package main
import "fmt"
func main() {
	//Too long an idenitifier, will be taken as (bbbb.....bbbb)
    var bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbba int;
	//Illegal identifier format
	var 4be int;
	//Badly terminated string
	var a string = "Hello
}