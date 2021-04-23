
# mini-golang-compiler

## Build and execution
-   To ensure the code works well, you need make, g++, flex/lex and bison installed in your system. 
    
-   Clone this repository into your local system. The project has a single global lex file, while has separate yacc files for each of the phases to ensure code cleanliness and ease of maintenance.
    
-   To build any of the phases, from a terminal, go into the directory and execute the MakeFile using the `make`  command. It then builds the compiler into an executable in the name of `gocompiler`  in that folder.
    
-   To run the compiler with an input file testinput.go, from the same directory as the previous step run `./gocompiler testinput.go`
    

**Note**: To help execute and test the compiler quickly, there are a set of prebuilt scripts in the scripts/ folder which will help build and execute predefined test cases using the compiler. Run `sh <script-name>.sh`

## Task List

### Lexical Analysis and Token Generation

  - [x] Conversion of strings to numbers.
  - [x] Handling Whitespace
  - [x] Handling Comments
  - [ ] Update yylval, yylloc, other global variables (line and col nums) and return token code for each action.
  - [ ] Record the line number and first and last column in yylloc for all tokens.
  - [x] Report lexical errors for improper strings, lengthy identifiers, and invalid characters.
  - [ ] For each character that cannot be matched to any token pattern, report it and continue parsing with the next character. 
  - [ ] If a string erroneously contains a newline, report an error and continue at the beginning of the next line.
  - [x] If an identifier is longer than the maximum (31 characters), report the error, truncate the identifier to the first 31 characters (discarding the rest), and continue.

### Symbol Table generation

  - [x] Data Value for identifiers
  - [ ] Line numbers for declaration and reference

### CFG and Parsing (Syntax validation)

   - [x] Printing
   - [x] Variable declaration 
   - [x] Const Declaration
   - [x] Assign Variables - int , float , string , bool , null 
   - [ ] Print Varible 
   - [x] Simple arithmetic expressions
   - [x] Increment and decrement variables
   - [ ] Boolean operations on variables 
   - [x] If condition
   - [x] If else condition
   - For loop 
		- [x] syntax validation 
		- [ ] computation
	- Function
	  - [x] Function declaration
	  - [ ] Function calls
	- Imports
	  - [x] Single import
	  - [x] Multiple imports
	- Identifiers
	  - [x] Compute Identifier values and insert in symbol table
	- [x] Print line number of syntax errors ```DONE```
	- [ ] Print col number of syntax errors
	- [ ] String computations
	- [ ] Recognising errors and suggesting fix
	- [x] Evaluate complex logical expressions
	
### TAC
  - [x] Semmatic error analysis
  - [x] Print out semantic errors and continue parsing ```Currentlt stops parsing```
  - [x] Quadraple format ```DONE```
  - [ ] Update Symbol table ```DONE```
  
### Optimisation
  - [x] Type 1 Optimisation ( Remove dead code/  unreachanble code ) ```DONE```
  - [x] Type 2 Optimisation ( Copy Propagation ) ```DONE```
  - [x] Type 3 Optimisation ( Constant Folding ) ```DONE```
  - [x] Type 4 Optimisation ( Constant Propagation ) ```DONE```
  
### Look into
  - [ ] Reduce conflicts
  - [ ] Parser error recovery ? Even if its declaration related!
  
### Deliverables
  - [x]  CFG
  - [ ]  All the files related to all the tasks
  - [x]  Symbol table with required Information
  - [ ]  ReadMe file for Syntax Error Handling Strategies
  - [x]  Abstract syntax tree printed in an inorder way.
  - [ ]  ReadMe file for Semantic Error Handling
  - [x]  Three address code (in Quadruple format) ```DONE```
  - [x]  Optimized Three address code. ```DONE```
  - [ ]  ReadMe file for the Overall Tasks
