all:
	lex ../lex.l
	yacc -d yacc.y -Wno-yacc --warnings=none
	g++ -w lex.yy.c SymbolTable.cpp SymbolTable.h y.tab.c -o gocompiler
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
