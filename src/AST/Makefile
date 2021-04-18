all:
	lex ast.l
	yacc -d ast.y -Wno-yacc
	g++ -w lex.yy.c ast.cpp ast.h y.tab.c -o gocompiler
		
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
