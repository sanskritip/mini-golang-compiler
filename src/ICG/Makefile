all:
	lex ../lex.l
	yacc -d tac.y -Wno-yacc
	g++ y.tab.c -ll -w -o gocompiler	
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
