cd ../symboltable
make
printf "\n Click enter to start running the tests"
read option
printf "\n-----------TEST 1 : Arithmetic & Relational------------\n"
./gocompiler ../test/test1.go
printf "\n Click enter to proceed to Test 2"
read option
printf "\n-------------------TEST 2 : IF-ELSE -------------------\n"
./gocompiler ../test/test2.go
printf "\n Click enter to proceed to Test 3"
read option
printf "\n-------------------TEST 3 : FOR LOOP ------------------\n"
./gocompiler ../test/test3_for.go
printf "\n Test cases exhausted!"
