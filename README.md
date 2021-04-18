# mini-golang-compiler

# TODO

### Lexical Analysis and Token Generation

  - [x] Conversion of strings to numbers.
  - [ ] Handling Whitespace
	- [ ] Handling Comments
	- [ ] Update yylval, yylloc, other global variables (line and col nums) and return token code for each action.
	- [ ] Record the line number and first and last column in yylloc for all tokens.
	- [ ] Report lexical errors for improper strings, lengthy identifiers, and invalid characters.
	- [ ] For each character that cannot be matched to any token pattern, report it and continue parsing with the next character. 
	- [ ] If a string erroneously contains a newline, report an error and continue at the beginning of the next line.
	- [ ] If an identifier is longer than the maximum (31 characters), report the error, truncate the identifier to the first 31 characters (discarding the rest), and continue.

### Symbol Table generation

  - [ ] Data Value for identifiers
  - [ ] Line numbers for declaration and reference

### CFG and Parsing (Syntax validation)

   - [ ] Printing
	- [ ] Variable declaration 
	- [ ] Const Declaration
	- [ ] Assign Variables - int , float , string , bool , null 
	- [ ] Print Varible 
	- [ ] Simple arithmetic expressions
	- [ ] Increment and decrement variables
	- [ ] Boolean operations on variables 
	- [ ] If condition
	- [ ] If else condition
	- For loop 
		- [ ] syntax validation 
		- [ ] computation
	- Function
	  - [ ] Function declaration
	  - [ ] Function calls
	- Imports
	  - [ ] Single import
	  - [ ] Multiple imports
	- Identifiers
	  - [ ] Compute Identifier values and insert in symbol table
	- [x] Print line number of syntax errors ```DONE```
	- [ ] Print col number of syntax errors
	- [ ] String computations
	- [ ] Recognising errors and suggesting fix
	- [ ] Evaluate complex logical expressions
	
### TAC
  - [ ] Semmatic error analysis
  - [ ] Print out semantic errors and continue parsing
  - [x] Quadraple format ```DONE```
  - [x] Update Symbol table ```DONE```
  
### Optimisation
  - [x] Type 1 Optimisation ( Remove dead code/  unreachanble code ) ```DONE```
  - [x] Type 2 Optimisation ( Copy Propagation ) ```DONE```
  - [x] Type 3 Optimisation ( Constant Folding ) ```DONE```
  - [x] Type 4 Optimisation ( Constant Propagation ) ```DONE```
  
### Look into
  - [ ] Reduce conflicts
  - [ ] Parser error recovery ? Even if its declaration related!
  
### Deliverables
  - [ ]  CFG
  - [ ]  All the files related to all the tasks
  - [ ]  Symbol table with required Information
  - [ ]  ReadMe file for Syntax Error Handling Strategies
  - [ ]  Abstract syntax tree printed in an inorder way.
  - [ ]  ReadMe file for Semantic Error Handling
  - [x]  Three address code (in Quadruple format) ```DONE```
  - [x]  Optimized Three address code. ```DONE```
  - [ ]  ReadMe file for the Overall Tasks
