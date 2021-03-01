all:
	flex src/lex.l
	g++ lex.yy.c -o lexer.out
	./lexer.out

clean:
	rm lex.yy.c