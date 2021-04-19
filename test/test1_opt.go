package main
import "fmt"
func main() {
	var b int;
	var r int;
	var q int;
	var CopyProp int;
	var DeadCode int;
	var ConstProp int;
	var Temp int;
	CopyProp = b;
	ConstProp = 5;
	r = CopyProp * ConstProp;
	deadCode = q * 3;
	//Constant Folding
	Temp = 8 / 4;
	//Since value computed for Temp, now Constant Propagation is done again
	Temp = Temp + 1;
	deadCode = q * 3;
}
