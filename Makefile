all:
	flex src/lex.l
	g++ -w lex.yy.c src/SymbolTable.cpp src/SymbolTable.h -o lexer.out
	./lexer.out

clean:
	rm lex.yy.c