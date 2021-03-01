all:
	lex src/lex.l
	yacc -d src/yacc.y
	g++ -w -c lex.yy.c y.tab.c src/SymbolTable.cpp src/SymbolTable.h -o lexer.out -ll
	./lexer
	g++ -o example-m.n lex.yy.o y.tab.o -ll

clean:
	rm *.yy.c
	rm *.out
