all:
	lex ../lex.l
	yacc -d tac.y --warnings=none
	g++ y.tab.c -ll -w -o gocompiler	
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
