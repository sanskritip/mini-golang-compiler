all:
	lex src/lex.l
	yacc -d src/yacc.y
	g++ -w lex.yy.c src/SymbolTable.cpp src/SymbolTable.h y.tab.c -o gocompiler
	./gocompiler test/test3_for.go
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm grammar.txt
	rm gocompiler
