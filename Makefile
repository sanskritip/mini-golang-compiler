all:
	lex src/lex.l
	yacc -d src/yacc.y -Wno-yacc
	g++ -w lex.yy.c src/SymbolTable.cpp src/SymbolTable.h y.tab.c -o gocompiler
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
