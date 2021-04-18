all:
	lex ../../lex.l
	yacc -d opt.y -Wno-yacc
	g++ y.tab.c -ll -w -o gocompiler	
	./gocompiler ../../../test/test1_opt.go
clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm gocompiler
