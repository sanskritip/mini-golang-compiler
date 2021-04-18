cd ../icg
make
printf "\n Click enter to proceed to Test 1"
read option
printf "\n-----------TEST 1 : Arithmetic & Relational------------\n"
./gocompiler test1.go
printf "\n Click enter to proceed to Test 2"
read option
printf "\n-------------------TEST 2 : FOR LOOP ------------------\n"
./gocompiler test3_for.go
