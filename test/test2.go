package main
import "fmt"
func main() {

    //If else statement 
    if 7%2 == 0 {
        fmt.Println("7 is even")
    } else {
        fmt.Println("7 is odd")
    }

    //If statement
    if 8%4 == 0 {
        fmt.Println("8 is divisible by 4")
    }

    //If with Simple statement

    var v int = 2
    if v++ ; v < 5 {
            fmt.Println(v, "is smaller than 5")
    }

	var num int = 9;
    //If - elseif - else statement
    if num < 0 {
        fmt.Println(num, "is negative");
    } else if num < 10 {
        fmt.Println(num, "has 1 digit");
    } else {
        fmt.Println(num, "has multiple digits");
    }
}