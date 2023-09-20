*.exe: *.l
	flex $<
	gcc lex.yy.c -o $.exe -lfl

clean:
	rm -f lex.yy.c a.out *.exe *~

