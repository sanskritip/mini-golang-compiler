cd ../AST
make
printf "\n Click enter to proceed to Tests"
read option
printf "\n-----------TEST 1 : Abstarct Syntax Tree------------\n"
./gocompiler test1_ast.go
